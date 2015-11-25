module wave_capture_tb();
	// DECLARATIONS
	
	// wave_capture declarations
	wire new_sample_ready; // maybe wire
	reg clk, reset, wave_display_idle;
	wire [15:0] new_sample_in;
   	wire [8:0] write_address;
  	wire write_enable, read_index;
  	wire [7:0] write_sample;

	// music player declarations
	reg play, next;
	
	reg new_frame;
	wire[15:0] codec_sample, flopped_sample;
	wire new_sample, flopped_new_sample;

	// mergers
	assign new_sample_ready = new_sample; // Fix this
	assign new_sample_in = flopped_sample;
	
	// testbench declarations
	

	// INSTANTIATIONS
	
	// wave capture module
	wave_capture wave_cap (
		.clk(clk),
		.reset(reset),
		.new_sample_ready(new_sample_ready), // Can't do this with 
		.new_sample_in(new_sample_in),
		.wave_display_idle(wave_display_idle),
		.write_address(write_address),
		.write_enable(write_enable),
		.write_sample(write_sample),
		.read_index(read_index));

	// music player module
	music_player #(.BEAT_COUNT(4)) player (
		.clk(clk),
		.reset(reset),
		.play_button(play),
		.next_button(next),
		.new_frame(new_frame),
		.sample_out(codec_sample),
		.new_sample_generated(new_sample) // Can't do this with ^^  Maybe you can.. Not too sure
	);
	dff #(.WIDTH(17)) sample_reg (
		.clk(clk),
		.d({new_sample, codec_sample}),
		.q({flopped_new_sample, flopped_sample}));
	

		
	// TESTS
	
	initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
	end

	initial begin
		#40
		forever begin
			#20 new_frame = 1'b1;
			#20 new_frame = 1'b0;
		end
	end
		

	initial begin
	reset = 1'b1;
	#20
	reset = 1'b0;
	#10

	// start playing the first song:
	
	play = 1'b1;
	next = 1'b0;
	wave_display_idle = 1'b0;
	#10 play = 1'b0;

	/*new_frame = 1'b1;
	#10 new_frame = 1'b0;
	#20 new_frame = 1'b1;
	#10 new_frame = 1'b0;
	*/
	
   	
   	#200 wave_display_idle = 1'b1;
	// #100 wave_display_idle = 1'b0;
		
		
		
	$display("Tests completed");
	end

endmodule
