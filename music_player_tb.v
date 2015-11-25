module music_player_tb();
	reg clk, reset, play_button, next_button, new_frame;
    wire new_sample_generated;
	wire [15:0] sample_out;

    music_player dut(
        .clk(clk),
        .reset(reset),
        .play_button(play_button),
        .next_button(next_button),
        .new_frame(new_frame),
        .new_sample_generated(new_sample_generated),
		.sample_out(sample_out)
);

// Clock and reset
    initial begin
        clk = 1'b0;
        reset = 1'b1;
        repeat (4) #5 clk = ~clk;
        reset = 1'b0;
        forever #5 clk = ~clk;
    end

    // Tests
    initial begin
	next_button = 0;
	new_frame = 0;
	#50 play_button = 1;
	#10 play_button = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;
	#40 new_frame = 1;
	#40 new_frame = 0;	
end


endmodule
