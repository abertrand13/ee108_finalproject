/* 
 The new MCU discards the play button and next button inputs in exchange for 
a 4 bit one hot signal explicitly giving the song number to be played (given from 
the launchpad)
*/


module new_mcu(
    input clk,
    input reset,
	// this is a one hot signal representing the song to be played (given by the hex value on the launchpad)
	// it remains constant until a new song number is pressed
    input [3:0] song_input,
    output play,
    output reset_player,
	//changed to 4 bit to hold 16 songs
    output [3:0] song,
    input song_done
);

	// this keeps track of when the song input changes
	wire [3:0] prev_song;
	dffr #(4) flipper2(
		.clk(clk),
		.r(reset),
		.d(song_input),
		.q(prev_song)
	);
	assign song_changed = (prev_song != song_input);

	// reset other modules when the song is changed or done
	assign reset_player = (song_changed | song_done);

	assign song = song_input;

	wire currState;
	wire nextState;
	reg next1;

	dffr #(1) flipper(
		.clk(clk),
		.r(reset),
		.d(nextState),
		.q(currState)
	);
	
	//only play when in the play state
	wire play1 = (currState == 1);
	assign play = play1;

	// this keeps track of the state. There are only two states: 
	// playing = 1
	// waiting = 0
   	always @(*) begin
		case({currState,song_done,song_changed})
			3'b000: 	next1 = 0;
			3'b001: 	next1 = 1;
			3'b010: 	next1 = 0;
			3'b011: 	next1 = 1;
			3'b100: 	next1 = 1;
			3'b101: 	next1 = 1;
			3'b110: 	next1 = 0;
			3'b111: 	next1 = 1;
			default: 	next1 = 0;
		endcase
	end
	
	//resets to waiting when reset pushed
	assign nextState = reset? 1'b0 : next1;
endmodule	
