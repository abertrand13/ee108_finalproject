module note_distributor_tb();

	reg clk, reset, play, beat, new_frame;
	reg load_new_note;
	reg generate_next_sample;
	reg [5:0] note_to_load, duration_to_load;
	wire [15:0] sample_out;
	wire new_sample_ready;

	// INSTANTIATIONS
	note_distributor sparknotes (
		.clk(clk),
		.reset(reset),
		.play(play),
		.beat(beat),
		.load_new_note(load_new_note),
		.generate_next_sample(generate_next_sample),
		.new_frame(new_frame),
		.note_to_load(note_to_load),
		.duration_to_load(duration_to_load),
		.sample_out(sample_out),
		.new_sample_ready(new_sample_ready)
	);

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
		generate_next_sample = 1'b1;
		new_frame = 1'b1;	
		#10 beat = 1'b0;
		generate_next_sample = 1'b0;
		new_frame = 1'b0;
	end

	initial begin
		// At least for the moment, I think testing the actual values that
		// come out of the note distributor is going to be a hot mess.
		// So instead, I'm just going to throw a bunch of notes at it and try
		// to determine whether they're being assigned to note players
		// correctly.
		// To check: well, we'll find that out, won't we?
		// And if this works...then I suppose we synthesize and pray!

		reset = 1'b1;
		#20 reset = 1'b0;
		
		play = 1'b1;
		#20

		note_to_load = 6'd40;
		duration_to_load = 6'd3;
		load_new_note = 1'b1;
		#10
		load_new_note = 1'b0;
		#10

		note_to_load = 6'd44;
		duration_to_load = 6'd3;
		load_new_note = 1'b1;
		#10
		load_new_note = 1'b0;
		#10

		note_to_load = 6'd47;
		duration_to_load = 6'd3;
		load_new_note = 1'b1;
		#10
		load_new_note = 1'b0;
		#60

		note_to_load = 6'd50;
		duration_to_load = 6'd3;
		load_new_note = 1'b1;
		#10
		load_new_note = 1'b0;
	end
endmodule
