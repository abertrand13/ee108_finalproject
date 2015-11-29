module color_changer(
	input button_pressed,
	input clk,
	input reset,
	input [3:0] button,		// May be used differently CHANGE BACK!!!!!!!!!!!!!!!!
	output [23:0] final_color,
	output done
);
	// CHANGED BUTTON ^^^^^^^
	wire [2:0] count;
	wire [3:0] value;
	wire [3:0] final_value;

	// HAVING DONE BE THE RESET MAY MESS THIS UP FOR A CLOCK CYCLE, SOMETHING TO CHECK.
	// ALSO SOMETHING TO SEE IF IT WILL ACTUALLY HAVE A PROBLEM CONSIDERING HOW FAST A 
	// CLOCK CYCLE ACTUALLY IS. ALSO NOT 100% SURE WE CAN HAVE AN OUTPUT AS AN INPUT HERE.

	dffre #(.WIDTH(3)) counter(
		.clk(clk),
		.r(reset || done),
		.d(count + 1),
		.q(count),
		.en(button_pressed)
	);

	dffre #(.WIDTH(8)) send_value(
		.clk(clk),
		.r(reset),
		.d(value),
		.q(final_value),
		.en(button_pressed)
	);

/*	read_button button_value(
		.button(button),
		.out(value)
	);
*/
	//	We could also have this outside and feeding it straight into the input...
	// To impliment:
	//	write a module (elsewhere) that will read in a given button value (2x2) 
	//	and return a 8 bit (4 bit hex) representation of it. from 0-15. We can then put this straight into the colors (abc)


	//	Start Combinational Logic
	reg [3:0] part_1;
	reg [3:0] part_2;
	reg [3:0] part_3;
	reg [3:0] part_4;
	reg [3:0] part_5;
	reg [3:0] part_6;

	initial @(*) begin
		case (count)
		1: 			{part_1, part_2, part_3, part_4, part_5, part_6, done} = {final_value, part_2, part_3, part_4, part_5, part_6, 1'b0};
		2: 			{part_1, part_2, part_3, part_4, part_5, part_6, done} = {part_1, final_value, part_3, part_4, part_5, part_6, 1'b0};
		3: 			{part_1, part_2, part_3, part_4, part_5, part_6, done} = {part_1, part_2, final_value, part_4, part_5, part_6, 1'b1};
		4: 			{part_1, part_2, part_3, part_4, part_5, part_6, done} = {part_1, part_2, part_3, final_value, part_5, part_6, 1'b0};
		5: 			{part_1, part_2, part_3, part_4, part_5, part_6, done} = {part_1, part_2, part_3, part_4, final_value, part_6, 1'b0};
		6:				{part_1, part_2, part_3, part_4, part_5, part_6, done} = {part_1, part_2, part_3, part_4, part_5, final_value, 1'b1};
		default: 	{part_1, part_2, part_3, part_4, part_5, part_6, done} = {part_1, part_2, part_3, part_4, part_5, part_6, 1'b0};
		endcase
	end

		// May want to add something about done here. Need a way to let them know value is ready.
		// Could potentially put done as a reset value for count, therefore only letting it be a 
		// one for a single pulse.

	assign final_color = {part_1, part_2, part_3, part_4, part_5, part_6};

	// WE MAY NEED TO HAVE R,G,B SET TO EQUAL SOMETHING IN THE STATE MACHINE (CASE AND SWITCH) THAT WE ARE USING TO KEEP
	// TRACK OF THE STATES IN OUR MAIN MODULE AND ONLY CHANGE FROM OUR STATE WHEN DONE == 1 AND SET R,G,B SET TO WHATEVER
	// COLORS WE OUTPUT. DURING OTHER STATES THEY EQUAL THEMSELVES. WILL NEED TO USE REG's.


endmodule
