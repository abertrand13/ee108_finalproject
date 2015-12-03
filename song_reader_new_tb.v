module song_reader_new_tb();

	// DECLARATIONS
	// inputs to song reader
	reg clk, reset, play, note_done;
	reg [1:0] song;
	reg beat;
	// outputs from song reader
	wire song_done, new_note;
	wire [5:0] note, duration;
	wire [2:0] metadata;	

	// Instantiations
	song_reader_new srn (
		.clk(clk),
		.reset(reset),
		.play(play),
		.note_done(note_done),
		.song(song),
		.beat(beat),
		.song_done(song_done),
		.new_note(new_note),
		.note(note),
		.duration(duration),
		.metadata(metadata));	

	// Clock
	initial forever begin
		#5 clk = 1'b0;
		#5 clk = 1'b1;
	end

	// Beats
	initial forever begin
		// it seems as though the beat generator one-pulses its outputs so
		// we're going to fake it here.  Sue me.
		#30 beat = 1'b1;
		#10 beat = 1'b0;
	end
	
	// Tests
	initial begin
		reset = 1'b1;
		#20 reset = 1'b0;
		
		// Initial shenanigans	
		play = 1'b1;
		note_done = 1'b0;
		song = 2'd1;

	end

endmodule
