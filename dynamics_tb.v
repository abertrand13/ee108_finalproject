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
		.new_sample_ready(new_sample_ready),
		.generate_next_sample(generate_next_sample),
		.final_sample(final_sample)
	);
	
	reg [15:0] expected_final_sample;
	// May try having sample come in as a value of 8 (or something smoothly divided by 8) to make
	// it easier to tell if it's subtracting by 1/8 every time. try 10400, 1300 is 1/8.
	initial begin
	// First Testing a Note with a 1/16sec Duration.
	reset = 1;
	note_duration = 6'd0;
	sample = 16'd0;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b0;
	expected_final_sample = 16'd0;
	#30
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample: %b, expected: %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample, expected_final_sample);
	
	reset = 0;
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b0;
	expected_final_sample = 16'd9100;
	#12
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd7800;
	#24
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd6500;
	#48
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd5200;
	#96
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd3900;
	#192
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd2600;
	#384
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd1300;
	#768
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd3;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd0;
	#1536
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd10400;
	new_sample_ready = 1'b1;
	generate_next_sample = 1'b0;
	expected_final_sample = 16'd10400;
	#10
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd9100;
	#96
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd7800;
	#192
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd6500;
	#384
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd5200;
	#768
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd3900;
	#1536
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd2600;
	#3072
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd1300;
	#6144
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	note_duration = 6'd24;
	sample = 16'd10400;
	new_sample_ready = 1'b0;
	generate_next_sample = 1'b1;
	expected_final_sample = 16'd0;
	#12288
	$display("Duration: %b, new_sample_ready : %b, generate_next_sample: %b, final_sample expected? %b",
	note_duration, new_sample_ready, generate_next_sample, final_sample == expected_final_sample);
	
	$stop;
	end
	
endmodule
