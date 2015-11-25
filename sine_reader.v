module sine_reader(
    input clk,
    input reset,
    input [19:0] step_size,
    input generate_next,

    output sample_ready,
    output wire [15:0] sample
);

	wire[21:0] next_address;
	wire[21:0] curr_address;

	wire[9:0] ROM_input;
	wire[15:0] sample_temp;
	wire shift_out1;

	dffre #(22) flipper(
		.clk(clk),
		.d(next_address),
		.q(curr_address),
		.r(reset),
		.en(generate_next)
	);

	dffr shift_register1(
		.clk(clk),
		.d(generate_next),
		.q(shift_out1),
		.r(reset)
	);
	
	dffr shift_register2(
		.clk(clk),
		.d(shift_out1),
		.q(sample_ready),
		.r(reset)
	);
	
	assign next_address = curr_address + step_size;

	
	assign ROM_input = curr_address[20] ? (10'd0-curr_address[19:10]-1'b1) : curr_address[19:10];

	sine_rom mySineROM(
		.clk(clk),
		.addr(ROM_input),
		.dout(sample_temp)
	);

	assign sample = curr_address[21] ? (16'd0-sample_temp) : sample_temp;


endmodule
