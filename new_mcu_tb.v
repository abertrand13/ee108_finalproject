module new_mcu_tb();
    reg clk, reset, song_done;
    reg [3:0] song_input;
    wire play, reset_player;
    wire [3:0] song;


    new_mcu dut(
        .clk(clk),
        .reset(reset),
        .song_input(song_input),
        .play(play),
        .reset_player(reset_player),
        .song(song),
        .song_done(song_done)
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
	song_done = 0;
	song_input = 2'd1;
	#50 song_input = 2'd2;
	#50 song_input = 2'd1;
	#10 song_done = 1;
	#10 song_done = 0;
	#50 song_input = 2'd1;
	#50 song_input = 2'd0;
    end

endmodule
