`define BEAT_INPUT 3'd4

module dynamics(
	input [5:0] note_duration,			// Taken from Note_Player
	input clk,
	input reset,
	input [15:0] sample,					// Taken from Note_Player/Harmonics
	input done_with_note,				// This is now Done_with_note
	input generate_next_sample,	//
	output [15:0] final_sample			
);

	// IGNORING THE ATTACK PHASE FOR NOW. IF WE WANT TO IMPLEMENT, WE WILL HAVE TO SLIGHTLY CHANGE HOW DECAY
	// WORKS BUT IT SHOULDN'T BE TOO MUCH...
	// We could theoretically just have a variable set into the reset of [counter, length_of_time & subtract_by]
	// which is true while we are attacking and possibly for a defined amount of time after. Say a total of 1/4
	// of the note. Then after we set it to false we could just subtract 1/8 of the note for the remaining amount
	// of time, making the remaining amount of time effectively the new note_duration. And WABAMM!!! we've got it.


	/* // Start Attack Phase and hold: Lets make attack always be a consistant 1/8 of note length, and hold it there
	   // for another 1/8th of a second, then begin decay.
	wire [3:0] attack_count;
	wire attack_zero, attack_done;
	wire [15:0] attack_final;
	dffre #(.WIDTH(4)) attack(
		.clk(clk),
		.r(reset || done_with_note),
		.d(attack_count + 1'b1),
		.q(attack_count),
		.en(attack_zero)
	);

	always @(*) begin
		case (attack_count)
		1:			{attack_final, attack_done} = {sample_subtract_8, 1'b0};
		2:			{attack_final, attack_done} = {sample_subtract_4, 1'b0};
		3:			{attack_final, attack_done} = {sample_subtract_4 + sample_subtract_8, 1'b0};
		4:			{attack_final, attack_done} = {sample_subtract_2, 1'b0};
		5:			{attack_final, attack_done} = {sample_subtract_2 + sample_subtract_8, 1'b0};
		6:			{attack_final, attack_done} = {sample_subtract_2 + sample_subtract_4, 1'b0};
		7:			{attack_final, attack_done} = {sample - sample_subtract_8, 1'b0};
		8:			{attack_final, attack_done} = {sample, 1'b1};
		default: {attack_final, attack_done} = {16'd0, 1'b0};
		endcase
	end
	
	// Attack_zero should be true after every 1/64 of note_duration

	// To account for the next 1/8 of duration of holding at max amplitude:
	// 

	// This should take care of making the remaining decay last for only 3/4 of the duration.
	// Effectively making the entire Attack and Decay last the whole amount of time.
	wire [13:0] new_decay_duration;
	assign new_decay_duration = new_duration >> 2	// This may not work, but worth a shot to test it.
	assign result = new_duration - new_decay_duration - subtractor;
	*/

	wire [3:0] count;
	wire [13:0] new_duration, temp_duration;
	wire [13:0] subtractor;
	wire zero;
	wire [13:0] result;
	assign zero = result == 0;
	assign temp_duration = {8'd0, note_duration};
	
	wire beat; //
	
	beat_generator #(.STOP(`BEAT_INPUT)) beat_gen( //
		.clk(clk),
		.reset(reset),
		.en(generate_next_sample),
		.beat(beat)
	); //

	// Keeps track of how much we should be subtracting from sample.
	// Every time result = 0 we increment count which then shifts the 
	// temp_duration left, making result a larger number than it was before.
	dffre #(.WIDTH(4)) counter(
		.clk(clk),
		.r(reset || done_with_note), // add || !attack_done
		.en(zero && subtractor > 0),	// make this subtractor > large number for the hold phase!!
		.d(count + 1'b1),
		.q(count)
	);
	
	// Used to make new_duration long enough.
	dffre #(.WIDTH(14)) length_of_time(
		.clk(clk),
		.r(reset || done_with_note), // add || !attack_done
		.d(temp_duration << count + 1'b1), // Changed this ( + 1 )
		.q(new_duration),
		.en(beat)	// Added
	);
	
	dffre #(.WIDTH(14)) subtract_by(
		.clk(clk),
		.r(reset || done_with_note || zero), // add || !attack_done
		.d(subtractor + 1'b1),
		.q(subtractor),
		.en(beat)	// Added
	);

	// whether it's time to drop the volume of the note again (or not)
	assign result = new_duration - subtractor;
	

	wire [15:0] sample_subtract_8;
	wire [15:0] sample_subtract_4;
	wire [15:0] sample_subtract_2;
	reg [15:0] final_temp;
	
	assign sample_subtract_2 = $signed(sample) >>> 1;
	assign sample_subtract_4 = $signed(sample) >>> 2;
	assign sample_subtract_8 = $signed(sample) >>> 3;
	
	always @(*) begin
		case (count)
		1:			final_temp = sample - sample_subtract_8;
		2:			final_temp = sample - sample_subtract_4;
		3:			final_temp = sample - sample_subtract_4 - sample_subtract_8;
		4:			final_temp = sample - sample_subtract_2;
		5:			final_temp = sample - sample_subtract_2 - sample_subtract_8;
		6:			final_temp = sample - sample_subtract_2 - sample_subtract_4;
		7:			final_temp = sample_subtract_8;
		8:			final_temp = 1'b0;
		default: final_temp = sample;
		endcase		
	end

	// There may be an issure with the above case statement where at the end of the note a single sample
	// is sent back that is at full amplitude.
	assign final_sample = final_temp;
	// For after ATTACK Phase
	// assign final_sample = attack_done ? final_temp : attack_final;

endmodule
