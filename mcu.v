`define PAUSE0 3'd0
`define PAUSE1 3'd1
`define PAUSE2 3'd2
`define PAUSE3 3'd3
`define SONG0 3'd4
`define SONG1 3'd5
`define SONG2 3'd6
`define SONG3 3'd7
module mcu(
    input clk,
    input reset,
    input play_button,
    input next_button,
    output play,
    output reset_player,
    output [1:0] song,
    input song_done
);
	wire [2:0] currState;
	wire [2:0] nextState;
	reg [2:0] next1;
	reg [1:0] song1;

	dff #(3) flipper(.clk(clk), .d(nextState), .q(currState));
	
	wire play1 = ((currState == (`SONG0)) | (currState == (`SONG1)) | (currState == (`SONG2)) | (currState == (`SONG3)));
	assign play = play1;

	assign reset_player = (next_button | song_done);

		// We will need to change this to work with our keypad, we basically want
		// to play a given set of notes for each keypad entry and then if we press
		// another keypad button, it will stop what it is doing and play the current
		// button's set of notes.
   	always @(*) begin
		casex({currState,next_button,play_button,song_done})
			{`PAUSE0,3'b000}: {next1,song1} = {`PAUSE0,2'b00};
			{`PAUSE0,3'bxx1}: {next1,song1} = {`PAUSE1,2'b00};
			{`PAUSE0,3'b1x0}: {next1,song1} = {`PAUSE1,2'b00};
			{`PAUSE0,3'b010}: {next1,song1} = {`SONG0,2'b00};
			
			{`PAUSE1,3'b000}: {next1,song1} = {`PAUSE1,2'b01};
			{`PAUSE1,3'bxx1}: {next1,song1} = {`PAUSE2,2'b01};
			{`PAUSE1,3'b1x0}: {next1,song1} = {`PAUSE2,2'b01};
			{`PAUSE1,3'b010}: {next1,song1} = {`SONG1,2'b01};

			{`PAUSE2,3'b000}: {next1,song1} = {`PAUSE2,2'b10};
			{`PAUSE2,3'bxx1}: {next1,song1} = {`PAUSE3,2'b10};
			{`PAUSE2,3'b1x0}: {next1,song1} = {`PAUSE3,2'b10};
			{`PAUSE2,3'b010}: {next1,song1} = {`SONG2,2'b10};

			{`PAUSE3,3'b000}: {next1,song1} = {`PAUSE3,2'b11};
			{`PAUSE3,3'bxx1}: {next1,song1} = {`PAUSE0,2'b11};
			{`PAUSE3,3'b1x0}: {next1,song1} = {`PAUSE0,2'b11};
			{`PAUSE3,3'b010}: {next1,song1} = {`SONG3,2'b11};

			{`SONG0,3'b000}: {next1,song1} = {`SONG0,2'b00};
			{`SONG0,3'bxx1}: {next1,song1} = {`PAUSE1,2'b00};
			{`SONG0,3'b1x0}: {next1,song1} = {`PAUSE1,2'b00};
			{`SONG0,3'b010}: {next1,song1} = {`PAUSE0,2'b00};

			{`SONG1,3'b000}: {next1,song1} = {`SONG1,2'b01};
			{`SONG1,3'bxx1}: {next1,song1} = {`PAUSE2,2'b01};
			{`SONG1,3'b1x0}: {next1,song1} = {`PAUSE2,2'b01};
			{`SONG1,3'b010}: {next1,song1} = {`PAUSE1,2'b01};
			
			{`SONG2,3'b000}: {next1,song1} = {`SONG2,2'b10};
			{`SONG2,3'bxx1}: {next1,song1} = {`PAUSE3,2'b10};
			{`SONG2,3'b1x0}: {next1,song1} = {`PAUSE3,2'b10};
			{`SONG2,3'b010}: {next1,song1} = {`PAUSE2,2'b10};

			{`SONG3,3'b000}: {next1,song1} = {`SONG3,2'b11};
			{`SONG3,3'bxx1}: {next1,song1} = {`PAUSE0,2'b11};
			{`SONG3,3'b1x0}: {next1,song1} = {`PAUSE0,2'b11};
			{`SONG3,3'b010}: {next1,song1} = {`PAUSE3,2'b11};
			
			default: {next1,song1} = {`PAUSE0,2'b00};
		endcase
	end
	
	assign song = song1;
	assign nextState = reset? `PAUSE0 : next1;
endmodule	
