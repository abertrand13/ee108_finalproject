module wave_display_tb();
	reg clk, reset, valid, read_index;
	reg [10:0] x;
	reg [9:0] y;
	wire [7:0] read_value;
	wire [8:0] read_address;
	wire valid_pixel;
	wire [7:0] r,g,b;
	// DECLARATIONS
	
	// INSTANTIATIONS
	wave_display dut(
		.clk(clk),
		.reset(reset),
		.valid(valid),
		.read_index(read_index),
		.x(x),
		.y(y),
		.read_value(read_value),
		.read_address(read_address),
		.valid_pixel(valid_pixel),
		.r(r),
		.g(g),
		.b(b)
	);
	fake_sample_ram ram_dut(
		.clk(clk),
		.addr(read_address),
		.dout(read_value)
	);
	
	// Clock
	initial begin
   clk = 1'b0;
   reset = 1'b1;
   repeat (4) #5 clk = ~clk;
   reset = 1'b0;
   forever #5 clk = ~clk;
	end

	// TESTING
	initial begin
	reset = 1;
	valid = 0;
	x = 11'd0;
	y = 10'd0;
	read_index = 1'b0;
	#45 reset = 0;
	$display("This is resetting the circuit, read_address: %b, valid_pixel: %b, colors(r,g,b): %b,%b,%b", read_address, valid_pixel, r, g, b);
	#10

	//For valid we almost always want it to be true.
	//Each clock cycle we want to increment x and y. 
	//X should start as 001 or 010 to actually show up. Y should start with 0.
	//Read index should stay at a certain value till (theoretically) our count hits 255.
		// This means we just change it arbitrarily after a certain amount and continue testing.
	//Read_value should be taken from fake_sample_ram.

	valid = 1;
	x = 11'b00110011010;
	y = 10'b0101101010;
	read_index = 0;
	#10 x = 11'b00110011011; y = 10'b0101101011;
	#10
	$display("Valid_pixel: %b, read_address: %b, colors: r %b, g %b, b %b, read_value: %b, expected %b", valid_pixel, read_address, r, g, b, read_value, {1'b0,x[7:1]} + 8'd104);
	

	valid = 1;
	x = 11'b00110011100;
	y = 10'b0101101100;
	read_index = 0;
	#10 x = 11'b00110011101; y = 10'b0101101101;
	#10
	$display("Valid_pixel: %b, read_address: %b, colors: r %b, g %b, b %b, read_value: %b, expected %b", valid_pixel, read_address, r, g, b, read_value, {1'b0,x[7:1]} + 8'd104);


	valid = 1;
	x = 11'b00110011110;
	y = 10'b0101101110;
	read_index = 0;
	#10 x = 11'b00110011111; y = 10'b0101101111;
	#10
	$display("Valid_pixel: %b, read_address: %b, colors: r %b, g %b, b %b, read_value: %b, expected %b", valid_pixel, read_address, r, g, b, read_value, {1'b0,x[7:1]} + 8'd104);
	
	//Start simulating a downward traveling signal.
	valid = 1;
	x = 11'b00110011110;
	y = 10'b0101101110;
	read_index = 0;
	#10 x = 11'b00110011101; y = 10'b0101101101;
	#10
	$display("Valid_pixel: %b, read_address: %b, colors: r %b, g %b, b %b, read_value: %b, expected %b", valid_pixel, read_address, r, g, b, read_value, {1'b0,x[7:1]} + 8'd104);
	
	valid = 1;
	x = 11'b00110011100;
	y = 10'b0101101100;
	read_index = 0;
	#10 x = 11'b001100111011; y = 10'b0101101011;
	#10
	$display("Valid_pixel: %b, read_address: %b, colors: r %b, g %b, b %b, read_value: %b, expected %b", valid_pixel, read_address, r, g, b, read_value, {1'b0,x[7:1]} + 8'd104);
	
	valid = 1;
	x = 11'b00110011010;
	y = 10'b0101101010;
	read_index = 0;
	#10 x = 11'b001100111001; y = 10'b0101101001;
	#10
	$display("Valid_pixel: %b, read_address: %b, colors: r %b, g %b, b %b, read_value: %b, expected %b", valid_pixel, read_address, r, g, b, read_value, {1'b0,x[7:1]} + 8'd104);
	/*
	#100
	read_index = 1;
	x = 11'b01100101010;
	y = 10'b1010101011;
	valid = 0;
	#10 x = */
	end
	

endmodule
