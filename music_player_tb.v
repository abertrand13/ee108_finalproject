// MUSIC PLAYER TEST BENCH

module music_player_tb();

	// DECLARATIONS
	reg clk, reset, play_btn, next_btn, new_frame, color_changing;
	reg [3:0] keypad_value;
	wire new_sample_generated;
	wire [15:0] sample_out;
	
	

	// INSTANTIATIONS
	music_player mp (
		.clk(clk),
		.reset(reset),
		.play_button(play_btn),
		.next_button(next_btn),
		.new_frame(new_frame),
		.keypad_value(keypad_value),
		.color_changing(color_changing),
		.new_sample_generated(new_sample_generated),
		.sample_out(sample_out));

	

	initial forever begin
		#5 clk = 1'b0;
		// new_frame = 1'b1;
		#5 clk = 1'b1;
		// new_frame = 1'b0;
	end

	initial forever begin
		#35 new_frame = 1'b1;
		#10 new_frame = 1'b0;
	end

	initial begin
		reset = 1'b1;
		#20 reset = 1'b0;
		play_btn = 1'b0;
		next_btn = 1'b0;
		color_changing = 1'b1;
		#30 keypad_value = 4'd0;
		#5 keypad_value = 4'd1;
		// #300 keypad_value = 4'd0;

	end

endmodule
