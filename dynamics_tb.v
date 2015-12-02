module dynamics_tb();

	//reg [5:0] attack;
	//reg [5:0] decay;
	reg [5:0] note_duration;
	reg clk;
	reg reset;
	reg [15:0] sample;
	reg new_sample_ready;
	reg generate_next_sample;
	wire [15:0] final_sample;
	
	initial begin
        clk = 1'b0;
        reset = 1'b1;
        repeat (4) #5 clk = ~clk;
        reset = 1'b0;
        forever #5 clk = ~clk;
    end
	
	dynamics dut(
		.note_duration(note_duration),
		.clk(clk),
		.reset(reset),
		.sample(sample),
		.done_with_note(new_sample_ready),
		.generate_next_sample(generate_next_sample),
		.final_sample(final_sample)
	);
	
	reg [15:0] expected_final_sample;
	// May try having sample come in as a value of 8 (or something smoothly divided by 8) to make
	// it easier to tell if it's subtracting by 1/8 every time. try 10400, 1300 is 1/8.
	initial begin
	// First Testing a Note with a 1/16sec Duration.
	reset = 1;
	note_duration = 6'd3;
	sample = 16'd0;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd0;
	#30
	$display("Duration: %b, new_sample_ready : %b, final_sample: %b, expected: %b",
	note_duration, new_sample_ready, final_sample, expected_final_sample);
	
	reset = 0;
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd9100;
	#125
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd7800;
	#250
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd6500;
	#490
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd5200;
	#970
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd3900;
	#1930
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd2600;
	#3850
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd1300;
	#7690
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd0;
	#15370
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd0 - 16'd10400;
	new_sample_ready = 1'b1;
	generate_next_sample = 1'b0;
	expected_final_sample = 16'd0 - 16'd10400;
	#10
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd0 - 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd0 - 16'd9100;
	#960
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd0 - 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd0 - 16'd7800;
	#1920
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd0 - 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd0 - 16'd6500;
	#3840
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd0 - 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd0 - 16'd5200;
	#7680
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd0 - 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd0 - 16'd3900;
	#15360
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd0 - 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd0 - 16'd2600;
	#30720
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd0 - 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd0 - 16'd1300;
	#61440
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd0 - 16'd10400;
	new_sample_ready = 1'b0;
	expected_final_sample = 16'd0;
	#122880
	$display("Duration: %b, new_sample_ready : %b, final_sample expected? %b",
	note_duration, new_sample_ready, final_sample == expected_final_sample);
	
	$stop;
	end
	
endmodule
