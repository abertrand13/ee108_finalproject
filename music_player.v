//
//  music_player module
//
//  This music_player module connects up the MCU, song_reader, note_player,
//  beat_generator, and codec_conditioner. It provides an output that indicates
//  a new sample (new_sample_generated) which will be used in lab 5.
//

module music_player(
    // Standard system clock and reset
    input clk,
    input reset,

    // Our debounced and one-pulsed button inputs.
    input play_button,
    input next_button,

    // The raw new_frame signal from the adau1761_codec.
    input new_frame,
	
	// switches on board
	input [2:0] sw_value,

    // This output must go high for one cycle when a new sample is generated.
    output wire new_sample_generated,

    // Our final output sample to the codec. This needs to be synced to
    // new_frame.
    output wire [15:0] sample_out,
	 input wire [3:0] keypad_value,
	 input color_changing
);
    // The BEAT_COUNT is parameterized so you can reduce this in simulation.
    // If you reduce this to 100 your simulation will be 10x faster.
    parameter BEAT_COUNT = 1000;

//
//  ****************************************************************************
//      MCU
//  ****************************************************************************
//

    wire play;
    wire reset_player;
//	 ****************************************************************************
    wire [3:0] current_song;
    wire song_done;
	 
	 new_mcu new_mcu(
		.clk(clk),
		.reset(reset),
		.song_input(keypad_value),
		.play(play),
		.reset_player(reset_player),
		.song(current_song),
		.song_done(song_done),
		.color_changing(color_changing)
);


//
//  ****************************************************************************
//      Song Reader
//  ****************************************************************************
//

    wire beat;
	 wire [5:0] note_to_play;
    wire [5:0] duration_for_note;
    wire new_note;
	 wire [2:0] metadata;
 
    song_reader_new song_reader_new(
        .clk(clk),
        .reset(reset | reset_player),
        .play(play),
        .song(current_song),
		.sw_value(sw_value),
        .song_done(song_done),
        .note(note_to_play),
        .duration(duration_for_note),
        .new_note(new_note),
		.beat(beat),
		.metadata(metadata)
    );

	 
//
//  ****************************************************************************
//      Note Player
//  ****************************************************************************
//

    // Hooking up note_player to the audio interface can be a little tricky,
    // so we did it here for you. You still need to implement the note_player
    // module itself and instantiate the other parts of music_player, though!

   
    wire generate_next_sample;
    wire [15:0] note_sample;
    wire note_sample_ready;
  	
	 note_distributor sparknotes(
		.clk(clk),
		.reset(reset | reset_player),
		.play(play),
		.beat(beat),
		.load_new_note(new_note),
		.generate_next_sample(generate_next_sample),
		.new_frame(new_frame),
		.note_to_load(note_to_play),
		.duration_to_load(duration_for_note),
		.sample_out(note_sample),
		.new_sample_ready(note_sample_ready)
	 );
//
//  ****************************************************************************
//      Beat Generator
//  ****************************************************************************
//  By default this will divide the generate_next_sample signal (48kHz from the
//  codec's new_frame input) down by 1000, to 48Hz. If you change the BEAT_COUNT
//  parameter when instantiating this you can change it for simulation.
//
    beat_generator #(.WIDTH(10), .STOP(BEAT_COUNT)) beat_generator(
        .clk(clk),
        .reset(reset),
        .en(generate_next_sample),
        .beat(beat)
    );

//
//  ****************************************************************************
//      Codec Conditioner
//  ****************************************************************************
//
    assign new_sample_generated = generate_next_sample;
    codec_conditioner codec_conditioner(
        .clk(clk),
        // NOTE: The reset input for codec_conditioner should always be the
        // PURE UNMODIFIED top-level reset signal. Do not mix it with anything
        // else.
        .reset(reset),
        .new_sample_in(note_sample),
        .latch_new_sample_in(note_sample_ready),
        .generate_next_sample(generate_next_sample),
        .new_frame(new_frame),
        .valid_sample(sample_out)
    );
	 
	 

endmodule
