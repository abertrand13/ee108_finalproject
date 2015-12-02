`define BEAT_INPUT 3'd4
// I'm actually attacking and Holding for 1/6 of the total for each... Not sure why...
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


	 // Start Attack Phase and hold: Lets make attack always be a consistant 1/8 of note length, and hold it there
	 // for another 1/8th of a second, then begin decay.
	wire beat;
	wire [4:0] attack_count;
	wire attack_zero;
	reg  attack_done;
	reg [15:0] attack_final_temp;
	wire [15:0] attack_final;
	wire [13:0] attack_duration, attack_subtract;
	wire decay;
	wire [13:0] hold;
	
	assign attack_duration = temp_duration << 2;
	assign attack_zero = attack_duration - attack_subtract == 0;
	assign decay = hold == attack_duration << 3;
	
	dffre #(.WIDTH(5)) attack(
		.clk(clk),
		.r(reset || done_with_note),
		.d(attack_count + 1'b1),
		.q(attack_count),
		.en(beat && attack_duration - attack_subtract == 1 && !attack_done)
	);
	
	dffre #(.WIDTH(14)) attack_sub(
		.clk(clk),
		.r(reset || done_with_note || attack_zero),
		.en(beat),
		.d(attack_subtract + 1'b1),
		.q(attack_subtract)
	);
	// Still haven't figured this out all the way.
	dffre #(.WIDTH(14)) hold_phase(
		.clk(clk),
		.r(reset),
		.en(beat && !decay && attack_done),
		.d(hold + 1'b1),
		.q(hold)
	);

	always @(*) begin
		case (attack_count)
		1:			{attack_final_temp, attack_done} = {sample_subtract_8, 1'b0};
		2:			{attack_final_temp, attack_done} = {sample_subtract_4, 1'b0};
		3:			{attack_final_temp, attack_done} = {sample_subtract_4 + sample_subtract_8, 1'b0};
		4:			{attack_final_temp, attack_done} = {sample_subtract_2, 1'b0};
		5:			{attack_final_temp, attack_done} = {sample_subtract_2 + sample_subtract_8, 1'b0};
		6:			{attack_final_temp, attack_done} = {sample_subtract_2 + sample_subtract_4, 1'b0};
		7:			{attack_final_temp, attack_done} = {sample - sample_subtract_8, 1'b0};
		8:			{attack_final_temp, attack_done} = {sample, 1'b1};
		default: {attack_final_temp, attack_done} = {16'd0, 1'b0};
		endcase
	end
	
	assign attack_final = attack_final_temp;
	
	// Attack_zero should be true after every 1/64 of note_duration

	// To account for the next 1/8 of duration of holding at max amplitude:
	// 

	// This should take care of making the remaining decay last for only 3/4 of the duration.
	// Effectively making the entire Attack and Decay last the whole amount of time.
	

	wire [3:0] count;
	wire [13:0] new_duration;
	wire [13:0] temp_duration;
	wire [13:0] fourth_temp_duration;
	wire [13:0] decay_duration;
	wire [13:0] subtractor;
	wire zero;
	wire [13:0] result;
	
	assign zero = result == 0;
	assign temp_duration = {8'd0, note_duration};
	assign fourth_temp_duration = temp_duration << 2;
	assign decay_duration = fourth_temp_duration + fourth_temp_duration + fourth_temp_duration;
	
	
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
		.d(count + 1'b1),
		.q(count),
		.en(zero && subtractor > 0 && attack_done && decay)
	);
	
	// Used to make new_duration long enough.
	dffre #(.WIDTH(14)) length_of_time(
		.clk(clk),
		.r(reset || done_with_note),
		.d(decay_duration << count + 1'b1), // Changed this from temp_duration
		.q(new_duration),
		.en(beat && attack_done && decay)	// Added
	);
	
	dffre #(.WIDTH(14)) subtract_by(
		.clk(clk),
		.r(reset || done_with_note || zero), // add || !attack_done
		.d(subtractor + 1'b1),
		.q(subtractor),
		.en(beat && attack_done && decay)	// Added
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
	//assign final_sample = final_temp;
	// For after ATTACK Phase
	assign final_sample = attack_done ? final_temp : attack_final;

endmodule
