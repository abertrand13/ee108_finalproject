
module new_mcu(
    input clk,
    input reset,
    input [3:0] song_input,
    output play,
    output reset_player,
	//changed to 4 bit to hold 16 songs
    output [3:0] song,
    input song_done
);
	wire [3:0] prev_song;
	dff #(4) flipper2(.clk(clk), .d(song_input), .q(prev_song));
	assign song_changed = (prev_song != song_input);

	assign reset_player = (song_changed | song_done);

	assign song = song_input;

	wire currState;
	wire nextState;
	reg next1;

	dff #(1) flipper(.clk(clk), .d(nextState), .q(currState));
	
	wire play1 = (currState == 1);
	assign play = play1;

   	always @(*) begin
		case({currState,song_done,song_changed})
			3'b000: next1 = 0;
			3'b001: next1 = 1;
			3'b010: next1 = 0;
			3'b011: next1 = 1;
			3'b100: next1 = 1;
			3'b101: next1 = 1;
			3'b110: next1 = 0;
			3'b111: next1 = 1;
			default: next1 = 0;
		endcase
	end

	assign nextState = reset? 0 : next1;
endmodule	
