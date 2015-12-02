module note_player(
/*    input clk,
    input reset,
    input play_enable,  				// When high we play, when low we don't.
    input [5:0] note_to_load,  		// The note to play
    input [5:0] duration_to_load,	// The duration of the note to play
    input load_new_note,  				// Tells us when we have a new note to load
    output done_with_note,  			// When we are done with the note this stays high.
    input beat,  							// This is our 1/48th second beat
    input generate_next_sample,  	// Tells us when the codec wants a new sample
    output [15:0] sample_out,  		// Our sample output
    output new_sample_ready  			// Tells the codec when we've got a sample
);

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

    sine_reader sine_read(
        .clk(clk),
        .reset(reset),
        .step_size(step_size),
        .generate_next(play_enable && generate_next_sample),
        .sample_ready(new_sample_ready),
        .sample(sample_out)
    );

    wire [5:0] state, next_state;
    dffre #(.WIDTH(6)) state_reg (
        .clk(clk),
        .r(reset),
        .en((beat || load_new_note) && play_enable),
        .d(next_state),
        .q(state)
    );
    assign next_state = (reset || done_with_note || load_new_note)
                        ? duration_to_load : state - 1'b1;

    assign done_with_note = (state == 6'b0) && beat;

endmodule
*/

	 input clk,
    input reset,
    input play_enable,  // When high we play, when low we don't.
    input [5:0] note_to_load,  // The note to play
    input [5:0] duration_to_load,  // The duration of the note to play
    input load_new_note,  // Tells us when we have a new note to load
    output done_with_note,  // When we are done with the note this stays high.
    input beat,  // This is our 1/48th second beat
    input generate_next_sample,  // Tells us when the codec wants a new sample
    output [15:0] sample_out,  // Our sample output
    output new_sample_ready  // Tells the codec when we've got a sample
);

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

    wire [5:0] state, next_state;
    dffre #(.WIDTH(6)) state_reg (
        .clk(clk),
        .r(reset),
        .en((beat || load_new_note) && play_enable),
        .d(next_state),
        .q(state)
    );
    assign next_state = (reset || done_with_note || load_new_note)
                        ? duration_to_load : state - 1;

     assign done_with_note = (state == 6'b0) && beat;
	  wire [15:0] temp_sample_out; // Changed vv as well
	  assign temp_sample_out = (($signed(sample_out1) >>> 1) + ($signed(sample_out2) >>> 2) + ($signed(sample_out3) >>> 2)); //
	  dynamics dyn( //
			.clk(clk),
			.reset(reset),
			.sample(temp_sample_out),
			.done_with_note(done_with_note), // Changed This
			.note_duration(duration_to_load),
			.final_sample(sample_out),
			.generate_next_sample(generate_next_sample)
		 );
    //assign sample_out = ((sample_out1 >> 1) + (sample_out2 >> 2) + (sample_out3 >> 2));
    assign new_sample_ready = (new_sample_ready1 && new_sample_ready2 && new_sample_ready3);
endmodule
