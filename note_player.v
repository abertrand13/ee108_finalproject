module note_player(
	input clk,
    input reset,
    input play_enable,  // When high we play, when low we don't.
    input [5:0] note_to_load,  // The note to play
    input [5:0] duration_to_load,  // The duration of the note to play
    input load_new_note,  // Tells us when we have a new note to load
    //output done_with_note,  // When we are done with the note this stays high.
    input beat,  // This is our 1/48th second beat
    input generate_next_sample,  // Tells us when the codec wants a new sample
    output [15:0] sample_out,  // Our sample output
    output new_sample_ready,  // Tells the codec when we've got a sample
	output playing,			// tells the note distributor if this note player is currently in use
	input new_frame
);

    //wire done_with_note; //Alex added this tuesday night

	wire [5:0] curr_note_duration; // the duration of the current note.  Input wire changes because we're reading in rests and things
	
	wire [19:0] step_size;
    wire [5:0] freq_rom_in;

    dffre #(.WIDTH(6)) freq_reg (
        .clk(clk),
        .r(reset),
        .en(load_new_note),
        .d(note_to_load),
        .q(freq_rom_in)
    );

    frequency_rom freq_rom(
        .clk(clk),
        .addr(freq_rom_in),
        .dout(step_size)
    );

    wire [15:0] sample_out1; 
    wire new_sample_ready1;
    sine_reader sine_read1(
        .clk(clk),
        .reset(reset),
        .step_size(step_size),
        .generate_next(play_enable && generate_next_sample),
        .sample_ready(new_sample_ready1),
        .sample(sample_out1)
    );

    wire [15:0] sample_out2; 
    wire new_sample_ready2;
    sine_reader sine_read2(
        .clk(clk),
        .reset(reset),
        .step_size(step_size >> 1),
        .generate_next(play_enable && generate_next_sample),
        .sample_ready(new_sample_ready2),
	.sample(sample_out2)
    );

    wire [15:0] sample_out3;
    wire new_sample_ready3;
    sine_reader sine_read3(
        .clk(clk),
        .reset(reset),
        .step_size(step_size >> 2),
        .generate_next(play_enable && generate_next_sample),
        .sample_ready(new_sample_ready3),
        .sample(sample_out3)
    );

    wire [5:0] state; // , next_state;
	 reg [5:0] next_state;
    dffre #(.WIDTH(6)) state_reg (
        .clk(clk),
        .r(reset),
        .en((beat || load_new_note) && play_enable),
        .d(next_state),
        .q(state)
    );
    /*assign next_state = (reset || done_with_note || load_new_note)
                        ? duration_to_load : state - 1'b1;*/
	always @(*) begin
		if(load_new_note || reset) begin
			next_state = duration_to_load;
		end else if(done_with_note) begin
			next_state = 1'b0;
		end else begin
			next_state = state - 1'b1;
		end
	end
	
	dffre #(.WIDTH(6)) duration_reg (
		.clk(clk),
		.r(reset),
		.en(load_new_note),
		.d(duration_to_load),
		.q(curr_note_duration)
	);
		

	// Hey guys, it's Alex.  I'm adding a thing!
	// assign playing = (!reset && state > 1'b0); // reset is for initial condition
	/*dffre #(.WIDTH(1)) currently_playing (
		.clk(clk),
		.r(reset),
		.en(load_new_note || done_with_note), // this may give us trouble if the two occur at the same time (or one right after another?)
		.d(~playing),
		.q(playing)
	);*/
	assign playing = state > 1'b0;

   assign done_with_note = (state == 6'b0);// && beat; //WAS causing an issue with static/overlap of notes
	 
	wire [15:0] temp_sample_out;
	assign temp_sample_out = (($signed(sample_out1) >>> 1) + ($signed(sample_out2) >>> 2) + ($signed(sample_out3) >>> 2)); //
	
	dynamics dyn( //
		.clk(clk),
		.reset(reset),
		.sample_start(temp_sample_out),
		.done_with_note(done_with_note), 
		.new_sample_ready(new_sample_ready),
		.note_duration(curr_note_duration),
		.final_sample(sample_out),
		.new_frame(new_frame)				
		);
	//assign sample_out = temp_sample_out;
    assign new_sample_ready = (new_sample_ready1 && new_sample_ready2 && new_sample_ready3);
endmodule
