module color_changer(
	input clk,
	input reset,
	input [3:0] value,
	input switch,
	input ready,
	output [23:0] final_color,
	output done
);

	wire [8:0] count;
	wire [3:0] final_value;

	reg [3:0] part_1;
	reg [3:0] part_2;
	reg [3:0] part_3;
	reg [3:0] part_4;
	reg [3:0] part_5;
	reg [3:0] part_6;

	dffre #(.WIDTH(9)) counter(
		.clk(clk),
		.r(reset || switch),
		.d(count + 1'b1),
		.q(count),
		.en(ready)
	);

	dffre #(.WIDTH(4)) get_value(
		.clk(clk),
		.r(reset || switch),
		.d(value),
		.q(final_value),
		.en(ready && count < 6)
	);

	//	Start Combinational Logic

	always @(*) begin
		case (count)
		1: 			{part_1, part_2, part_3, part_4, part_5, part_6} = {final_value, part_2, part_3, part_4, part_5, part_6};
		2: 			{part_1, part_2, part_3, part_4, part_5, part_6} = {part_1, final_value, part_3, part_4, part_5, part_6};
		3: 			{part_1, part_2, part_3, part_4, part_5, part_6} = {part_1, part_2, final_value, part_4, part_5, part_6};
		4: 			{part_1, part_2, part_3, part_4, part_5, part_6} = {part_1, part_2, part_3, final_value, part_5, part_6};
		5: 			{part_1, part_2, part_3, part_4, part_5, part_6} = {part_1, part_2, part_3, part_4, final_value, part_6};
		6:				{part_1, part_2, part_3, part_4, part_5, part_6} = {part_1, part_2, part_3, part_4, part_5, final_value};
		default: 	{part_1, part_2, part_3, part_4, part_5, part_6} = {part_1, part_2, part_3, part_4, part_5, part_6};
		endcase
	end

	assign final_color = {part_1, part_2, part_3, part_4, part_5, part_6};
	assign done = count >= 6;


endmodule
