// SONG READER NEW MODULE
// Manages the reading of song_rom to get notes, and
// passing those notes to note_player


`define PAUSE 	5'b00000 // This pauses the song.  Triggered when we press pause
`define READ 	5'b00001	// This reads the next note
`define REST 	5'b00010 // Resting before we read the next note (after we hit a rest in the ROM)
`define WAIT 	5'b00100	// This goes through a wait cycle to allow the song ROM a cycle to return
`define INCR 	5'b01000	// Increments the addr so we know which note we are on.  Do we need this anymore?


module song_reader_new(
	input clk,
	input reset, 
	input play, 					// whether or not to play (pause button affects this)
	input note_done,				// Comes from note_player when a note is finished.  Do we need this?
	input [1:0] song,				// what song we're currently playing
	input beat,						// the (48th of a second) beat
	output song_done,				// go high when we're finished reading a particular song
	output new_note,				// outputs to note_player when its time to play new note
   	output [5:0] note, duration,	// the rest is info about the note to play
   	output [2:0] metadata
);
	
	wire [6:0] addr;
	wire [4:0] note_addr;
	assign addr = {song, note_addr};

	reg new_note_reg;
	assign new_note = new_note_reg;


	wire note_type;	// whether we've read in a note or a rest (the first bit)
	
	// Song ROM
	song_rom lib(
		.clk(clk),
		.addr(addr),
		.dout({note_type, note, duration, metadata})
		);


	wire [4:0] state;
	reg [4:0] next;
	
	// keeps track of what state we're in	
	dffr #(5) states(
		.r(reset),
		.clk(clk),
		.d(next),
		.q(state)
	);
	
	// increments the note address to read from the song rom
	// note that this is a 'greedy' reader - it goes until it hits a rest
	dffre #(5) increment( // will have to up the bits on this to accomodate larger ROM
		.r(reset),
		.clk(clk),
		.d(note_addr + 1'b1),
		.q(note_addr),
		.en(state == `INCR)
	);
	
	wire [4:0] rest_beats; // current number of beats we've rested
	reg [4:0] total_rest_beats; // number of rest beats we need to get to

	
	
	dffre #(5) rest_counter (
		.clk(clk),
		.r(reset || rest_beats == total_rest_beats),
		.d(state == `REST ? rest_beats + 1'b1 : 1'b0),
		.q(rest_beats),
		.en(beat)
	);

	always @(*) begin
		case(state)
			`PAUSE : next = (play ? `READ : `PAUSE); // this may cause problems if you resume in the middle of a rest?
			`READ : begin
				next = `WAIT; // I don't like this mandatory delay, but it may be necessary
			end
			`WAIT : begin
				next = (note_type == 1'b0 ? `INCR : `REST);
				new_note_reg = ~note_type;
				if(note_type) begin
					total_rest_beats = note; // hack.  works because bit representations
				end else begin
					total_rest_beats = 1'b0;
				end
			end
			`INCR : begin	
				new_note_reg = 1'b0;
				next = `READ; // THIS IS SO MUCH DELAY
			end
			`REST : begin
				new_note_reg = 1'b0;	
				next = (rest_beats == total_rest_beats ? `INCR : `REST);
			end
			default: next = `PAUSE;
		endcase
	end
	
	//assign song_done = (note_done && (addr[4:0] == 5'd31));
	assign song_done = (addr[4:0] == 5'd31); // temporary hack.  problem was rests never generate a note_done signal
	
endmodule
