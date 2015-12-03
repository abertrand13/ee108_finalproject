module note_player_tb();

    reg clk, reset, play_enable, generate_next_sample;
    reg [5:0] note_to_load;
    reg [5:0] duration_to_load;
    reg load_new_note;
    wire done_with_note, new_sample_ready, beat;
    wire [15:0] sample_out;
    reg expected_DWN, expected_NSR;
	 reg new_frame;

    note_player np(
        .clk(clk),
        .reset(reset),
        .play_enable(play_enable),
        .note_to_load(note_to_load),
        .duration_to_load(duration_to_load),
        .load_new_note(load_new_note),
        .done_with_note(done_with_note),
        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(sample_out),
        .new_sample_ready(new_sample_ready),
		  .new_frame(new_frame)
    );
	// Changed to 4 clk cycles per beat
    beat_generator #(.WIDTH(17), .STOP(3)) beat_generator(
        .clk(clk),
        .reset(reset),
        .en(1'b1),
        .beat(beat)
    );

    // Clock and reset
    // Clock cycle is a full #10
    initial begin
        clk = 1'b0;
        reset = 1'b1;
        repeat (4) #5 clk = ~clk;
        reset = 1'b0;
        forever #5 clk = ~clk;
    end

   // Tests
   initial begin
	reset = 1;
	play_enable = 0;
	generate_next_sample = 0;
	note_to_load = 6'b001010;
	duration_to_load = 6'b000010;
	load_new_note = 0;
	expected_DWN = 0;
	expected_NSR = 0;
	#40
	$display("Note %b, Duration %b, expected DWN %b, actual %b, expected NSR %b actual %b, expected SO nothing actual %b",
				note_to_load, duration_to_load, expected_DWN, done_with_note, expected_NSR, new_sample_ready, sample_out);

	reset = 0;
	play_enable = 1;
	generate_next_sample = 1;
	load_new_note = 1;
	expected_DWN = 0;
	expected_NSR = 1; 
	#30 load_new_note = 0;
	$display("Note %b, Duration %b, expected DWN %b, actual %b, expected NSR %b actual %b, expected SO something actual %b",
				note_to_load, duration_to_load, expected_DWN, done_with_note, expected_NSR, new_sample_ready, sample_out);
	
	expected_DWN = 0;
	expected_NSR = 1;
	#30 
	$display("Note %b, Duration %b, expected DWN %b, actual %b, expected NSR %b actual %b, expected SO something actual %b",
				note_to_load, duration_to_load, expected_DWN, done_with_note, expected_NSR, new_sample_ready, sample_out);
	
	generate_next_sample = 1;
	note_to_load = 6'b010110;
	duration_to_load = 5'b000101;
	#50 expected_DWN = 1; expected_NSR = 1;
	#20 
	$display("Note %b, Duration %b, expected DWN %b, actual %b, expected NSR %b actual %b, expected SO something actual %b",
				note_to_load, duration_to_load, expected_DWN, done_with_note, expected_NSR, new_sample_ready, sample_out);
	
	load_new_note = 1;
	expected_DWN = 0;
	expected_NSR = 1;
	#30 load_new_note = 0;
	$display("Note %b, Duration %b, expected DWN %b, actual %b, expected NSR %b actual %b, expected SO something actual %b",
				note_to_load, duration_to_load, expected_DWN, done_with_note, expected_NSR, new_sample_ready, sample_out);
	
	#190 expected_DWN = 1; expected_NSR = 1;
	#20
	$display("Note %b, Duration %b, expected DWN %b, actual %b, expected NSR %b actual %b, expected SO something actual %b",
				note_to_load, duration_to_load, expected_DWN, done_with_note, expected_NSR, new_sample_ready, sample_out);
	
	reset = 1;
	play_enable = 0;
	generate_next_sample = 0;
	expected_DWN = 0;
	expected_NSR = 0;
	#30
	$display("Note %b, Duration %b, expected DWN %b, actual %b, expected NSR %b actual %b, expected SO nothing actual %b",
				note_to_load, duration_to_load, expected_DWN, done_with_note, expected_NSR, new_sample_ready, sample_out);
	#200
	$stop;
	

   end

endmodule
