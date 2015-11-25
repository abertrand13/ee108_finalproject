// SONG READER MODULE
// Manages the reading of song_rom to get notes, and
// passing those notes to note_player


`define PAUSE 3'b000 // This pauses the song
`define READ 3'b001	// This reads the next note
`define WAIT 3'b010	// This goes through a wait cycle to catch up
`define WAIT_DONE 3'b011	// This waits until note_done is high
`define INCREMENT 3'b100	// Increments the addr so we know which note we are on


module song_reader(
	input clk,
	input reset, 
	input play, 
	input note_done,						// Comes from note_player
	input [1:0] song,
   	output song_done,
	output new_note,						// outputs to note_player when time to play new note
   	output [5:0] note, duration
   );
	
	wire [6:0] addr;
	wire [4:0] note_addr; 
	
	assign addr = {song, note_addr};

	// INSTANTIATIONS
  
	// Song ROM
	song_rom lib(
		.clk(clk),
		.addr(addr),
		.dout({note, duration})
		);


	wire [2:0] state;
	reg [2:0] next;
	
	dffr #(3) states(
		.r(reset),
		.clk(clk),
		.d(next),
		.q(state)
	);
	
	dffre #(5) increment(
		.r(reset),
		.clk(clk),
		.d(note_addr + 1'b1),
		.q(note_addr),
		.en(state == `INCREMENT)
	);

	always @(*) begin
		case(state)
		`PAUSE 		: 	next = play ? `READ : `PAUSE;
		`READ			:	next = play ? `WAIT : `PAUSE;
		`WAIT			:	next = play ? `WAIT_DONE : `PAUSE;
		`WAIT_DONE	:	next = (play && note_done) ? `INCREMENT : (play ? `WAIT_DONE: `PAUSE);
		`INCREMENT	:	next = `READ;
		
		default next = `PAUSE;
		endcase
	end
	
	assign new_note = state == `WAIT ? 1'b1 : 1'b0;
	assign song_done = (note_done && (addr[4:0] == 5'd31));
	
endmodule
