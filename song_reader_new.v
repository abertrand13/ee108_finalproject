// SONG READER NEW MODULE
// Manages the reading of song_rom to get notes, and
// passing those notes to note_player

	// Changed PAUSE back to all zeros so that at reset it starts there.
`define PAUSE 	5'b00000 // This pauses the song.  Triggered when we press pause
`define READ 	5'b10000	// This reads the next note
`define REST 	5'b00001 // Resting before we read the next note (after we hit a rest in the ROM)
`define WAIT 	5'b00010	// This goes through a wait cycle to allow the song ROM a cycle to return
`define INCR 	5'b00100	// Increments the addr so we know which note we are on.  Do we need this anymore?


module song_reader_new(
	input clk,
	input reset, 
	input play, 					// whether or not to play (pause button affects this)
	input [3:0] song,				// what song we're currently playing
	input beat,						// the (48th of a second) beat
	input [2:0] sw_value,			// output of the switches on board
	output song_done,				// go high when we're finished reading a particular song
	output new_note,				// outputs to note_player when its time to play new note
	output [5:0] note, duration,	// the rest is info about the note to play
	output [2:0] metadata
);
	
	wire [8:0] addr;
	wire [4:0] note_addr;
	assign addr = {song, note_addr};

	reg new_note_reg;
	reg [5:0] note_reg, duration_reg;
	reg [2:0] metadata_reg;
	assign new_note = new_note_reg;


	reg note_type;	// whether we've read in a note or a rest (the first bit)
	
	wire [15:0] out1, out2, out3, out4, out5; // outputs of different song roms
	
	// Song ROMS
	song_rom1 lib1(
		.clk(clk),
		.addr(addr),
		.dout(out1)
		//.dout({note_type, note, duration, metadata})
		);
	
	song_rom2 lib2(
		.clk(clk),
		.addr(addr),
		.dout(out2)
		);
		
	song_rom3 lib3(
		.clk(clk),
		.addr(addr),
		.dout(out3)
	);
	
	song_rom4 lib4(
		.clk(clk),
		.addr(addr),
		.dout(out4)
	);
	
	song_rom5 lib5(
		.clk(clk),
		.addr(addr),
		.dout(out5)
	);
	
		
	always @(*) begin
		case(sw_value)
			3'd1 : {note_type, note_reg, duration_reg, metadata_reg} = out1;
			3'd2 : {note_type, note_reg, duration_reg, metadata_reg} = out2;
			3'd3 : {note_type, note_reg, duration_reg, metadata_reg} = out3;
			3'd4 : {note_type, note_reg, duration_reg, metadata_reg} = out4;
			3'd5 : {note_type, note_reg, duration_reg, metadata_reg} = out5;
			default : {note_type, note_reg, duration_reg, metadata_reg} = out1;
		endcase
	end
		
	assign duration = duration_reg;
	assign note = note_reg;


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
	
	
	wire [5:0] rest_beats; // current number of beats we've rested
	reg [5:0] total_rest_beats; // number of rest beats we need to get to

	dffre #(6) rest_counter (
		.clk(clk),
		.r(reset || rest_beats == total_rest_beats || state != `REST),
		.d(rest_beats + 1'b1),
		.q(rest_beats),
		.en(beat && state == `REST)
	);

	always @(*) begin
		case(state)
			`PAUSE : next = (play ? `READ : `PAUSE); // this may cause problems if you resume in the middle of a rest?
			`READ : begin		// This just helps us wait a clock cycle for songROM
				next = `WAIT; // I don't like this mandatory delay, but it may be necessary
			end
			`WAIT : begin
				next = (note_type == 1'b0 ? `INCR : `REST);
				new_note_reg = ~note_type;
				if(note_type) begin
					total_rest_beats = note_reg; // hack.  works because bit representations
				end else begin
					total_rest_beats = 1'b0;
				end
			end
			`INCR : begin	
				new_note_reg = 1'b0;
				next = song_done ? `PAUSE : `READ;
			end
			`REST : begin
				new_note_reg = 1'b0;	 
				next = (rest_beats == total_rest_beats ? `INCR : `REST);
			end
			default: next = `PAUSE;  // Changed This from PAUSE
		endcase
	end
	
	//assign song_done = (note_done && (addr[4:0] == 5'd31));
	assign song_done = (addr[4:0] == 5'd31);// && (rest_beats == total_rest_beats - 1'b1) && (total_rest_beats > 1'b0); // temporary hack.  problem was rests never generate a note_done signal
	
endmodule
