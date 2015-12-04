module color_changer(
	input clk,
	input reset,
	input [3:0] value,
	output [23:0] final_color,
	output done
);

	wire [2:0] count;
	wire [3:0] final_value;

	// HAVING DONE BE THE RESET MAY MESS THIS UP FOR A CLOCK CYCLE, SOMETHING TO CHECK.

	reg [3:0] part_1;
	reg [3:0] part_2;
	reg [3:0] part_3;
	reg [3:0] part_4;
	reg [3:0] part_5;
	reg [3:0] part_6;
	reg done_temp;

	dffr #(.WIDTH(3)) counter(
		.clk(clk),
		.r(reset || done),
		.d(count + 1'b1),
		.q(count)
	);

	dffr #(.WIDTH(4)) get_value(
		.clk(clk),
		.r(reset),
		.d(value),
		.q(final_value)
	);

	//	Start Combinational Logic

	always @(*) begin
		case (count)
		1: 			{part_1, part_2, part_3, part_4, part_5, part_6, done_temp} = {final_value, part_2, part_3, part_4, part_5, part_6, 1'b0};
		2: 			{part_1, part_2, part_3, part_4, part_5, part_6, done_temp} = {part_1, final_value, part_3, part_4, part_5, part_6, 1'b0};
		3: 			{part_1, part_2, part_3, part_4, part_5, part_6, done_temp} = {part_1, part_2, final_value, part_4, part_5, part_6, 1'b1};
		4: 			{part_1, part_2, part_3, part_4, part_5, part_6, done_temp} = {part_1, part_2, part_3, final_value, part_5, part_6, 1'b0};
		5: 			{part_1, part_2, part_3, part_4, part_5, part_6, done_temp} = {part_1, part_2, part_3, part_4, final_value, part_6, 1'b0};
		6:				{part_1, part_2, part_3, part_4, part_5, part_6, done_temp} = {part_1, part_2, part_3, part_4, part_5, final_value, 1'b1};
		default: 	{part_1, part_2, part_3, part_4, part_5, part_6, done_temp} = {part_1, part_2, part_3, part_4, part_5, part_6, 1'b0};
		endcase
	end

	assign final_color = {part_1, part_2, part_3, part_4, part_5, part_6};
	assign done = count == 6;

	// WE MAY NEED TO HAVE R,G,B SET TO EQUAL SOMETHING IN THE STATE MACHINE (CASE AND SWITCH) THAT WE ARE USING TO KEEP
	// TRACK OF THE STATES IN OUR MAIN MODULE AND ONLY CHANGE FROM OUR STATE WHEN DONE == 1 AND SET R,G,B SET TO WHATEVER
	// COLORS WE OUTPUT. DURING OTHER STATES THEY EQUAL THEMSELVES. WILL NEED TO USE REG's.


endmodule
