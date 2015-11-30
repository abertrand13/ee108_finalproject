`define BEAT_INPUT 3'd4

module dynamics(
	input [5:0] note_duration,			// Taken from Note_Player
	input clk,
	input reset,
	input [15:0] sample,					// Taken from Note_Player/Harmonics
	input new_sample_ready,				// Also Taken from Note_player
	output [15:0] final_sample			
);

	// IGNORING THE ATTACK PHASE FOR NOW. IF WE WANT TO IMPLEMENT, WE WILL HAVE TO SLIGHTLY CHANGE HOW DECAY
	// WORKS BUT IT SHOULDN'T BE TOO MUCH...
	// We could theoretically just have a variable set into the reset of [counter, length_of_time & subtract_by]
	// which is true while we are attacking and possibly for a defined amount of time after. Say a total of 1/4
	// of the note. Then after we set it to false we could just subtract 1/8 of the note for the remaining amount
	//	of time, making the remaining amount of time effectively the new note_duration. And WABAMM!!! we've got it.

	wire [3:0] count;
	wire [13:0] new_duration, temp_duration;
	wire [13:0] subtractor;
	wire zero;
	wire [13:0] result;
	assign zero = result == 0;
	assign temp_duration = note_duration;

	dffre #(.WIDTH(4)) counter(
		.clk(clk),
		.r(reset || new_sample_ready),
		.en(zero),
		.d(count + 1'b1),
		.q(count)
	);
	
	// Used to make new_duration long enough.
	dffr #(.WIDTH(14)) length_of_time(
		.clk(clk),
		.r(reset || new_sample_ready),
		.d(temp_duration << count + 1), // Changed this ( + 1 )
		.q(new_duration)
	);
	
	dffr #(.WIDTH(14)) subtract_by(
		.clk(clk),
		.r(reset || new_sample_ready || zero),
		.d(subtractor + 1'b1),
		.q(subtractor)
	);

	assign result = new_duration - subtractor;
	

	wire [15:0] sample_subtract_8;
	wire [15:0] sample_subtract_4;
	wire [15:0] sample_subtract_2;
	reg [15:0] final_temp;
	
	assign sample_subtract_2 = sample >> 1;
	assign sample_subtract_4 = sample >> 2;
	assign sample_subtract_8 = sample >> 3;
	
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

	assign final_sample = final_temp;


endmodule