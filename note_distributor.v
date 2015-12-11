`define NP1  3'b001
`define NP2  3'b010
`define NP3  3'b100
`define NONE 3'b000

module note_distributor (
	input clk,						// clk signal
	input reset,					// reset signal
	input play,						// whether we're playing or (paused?)
	input beat,						// beat (48Hz from beat_generator)
	input load_new_note,			// tells us when a new note is ready to be played
	input generate_next_sample,		// tells us when the codec wants a new sample
	input new_frame,				// not quite sure what this tells us
	input [5:0] note_to_load,		// tells us what note to play
	input [5:0] duration_to_load,	// tells us how long to play the note for
	output [15:0] sample_out,		// the sample we output
	output new_sample_ready			// tells the codec we've got a new sample for it
);
	
	
	// vars for each note player
	wire np1_playing, np2_playing, np3_playing; // used to tell which nps are ready for new notes
	wire [15:0] np1_sample, np2_sample, np3_sample;
	wire np1_sample_ready, np2_sample_ready, np3_sample_ready;
	wire np1_load, np2_load, np3_load; // used to tell which np to send a new note to
	reg [2:0] np_to_use; // keeps track of which np we'll use for the next note

	// essentially rolling an arbiter here, because apparently they're not
	// built in.  sad face.
	always @(*) begin
		if(!np1_playing) begin
			np_to_use = `NP1;
		end
		else if(!np2_playing) begin
			np_to_use = `NP2;
		end
		else if(!np3_playing) begin
			np_to_use = `NP3;
		end
		else np_to_use = `NONE;
	end
	
	
	// flip flops for each note player
	// needs to carry the load_new_note signal, and I think that's all?
	
	// ff for note player 1	
	dffre #(.WIDTH(1)) flip (
		.clk(clk),
		.r(reset),
		.en(np_to_use == `NP1 || np1_load), // make sure the signal goes low right after it goes high
		.d(load_new_note),		
		.q(np1_load)
	);
	
	// ff for note player 2
	dffre #(.WIDTH(1)) flop (
		.clk(clk),
		.r(reset),
		.en(np_to_use == `NP2 || np2_load),
		.d(load_new_note),
		.q(np2_load)
	);

	// ff for note player 3
	dffre #(.WIDTH(1)) flap (
		.clk(clk),
		.r(reset),
		.en(np_to_use == `NP3 || np3_load),
		.d(load_new_note),
		.q(np3_load)
	);
	
	
	// note player 1	
	note_player np1 (
		// inputs	
		.clk(clk),
		.reset(reset),
		.play_enable(play),
		.beat(beat),
		.generate_next_sample(generate_next_sample),
		.new_frame(new_frame),
		.load_new_note(np1_load),
		.note_to_load(note_to_load),
		.duration_to_load(duration_to_load),
		// outputs	
		.playing(np1_playing),
		.sample_out(np1_sample),
		.new_sample_ready(np1_sample_ready));

	// note player 2
	note_player np2 (
		// inputs	
		.clk(clk),
		.reset(reset),
		.play_enable(play),
		.beat(beat),
		.generate_next_sample(generate_next_sample),
		.new_frame(new_frame),
		.load_new_note(np2_load),
		.note_to_load(note_to_load),
		.duration_to_load(duration_to_load),
		// outputs	
		.playing(np2_playing),
		.sample_out(np2_sample),
		.new_sample_ready(np2_sample_ready));

	// note player 3
	note_player np3 (
		// inputs	
		.clk(clk),
		.reset(reset),
		.play_enable(play),
		.beat(beat),
		.generate_next_sample(generate_next_sample),
		.new_frame(new_frame),
		.load_new_note(np3_load),
		.note_to_load(note_to_load),
		.duration_to_load(duration_to_load),
		// outputs		
		.playing(np3_playing),
		.sample_out(np3_sample),
		.new_sample_ready(np3_sample_ready));

	
	// output final sample	
	assign new_sample_ready = np1_sample_ready || np2_sample_ready || np3_sample_ready;
	wire [15:0] np1_sample_vol, np2_sample_vol, np3_sample_vol;
	assign np1_sample_vol = $signed(np1_sample) >>> (2);
	assign np2_sample_vol = $signed(np2_sample) >>> (2);	
	assign np3_sample_vol = $signed(np3_sample) >>> (2);
	
	
	assign sample_out = np1_sample_vol + np2_sample_vol + np3_sample_vol;
	
endmodule
