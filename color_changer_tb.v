module color_changer_tb();
	
	reg button_pressed;
	reg clk;
	reg reset;
	reg [1:0] row, col;		
	wire [23:0] final_color;
	wire done;
	
	initial begin
        clk = 1'b0;
        reset = 1'b1;
        repeat (4) #5 clk = ~clk;
        reset = 1'b0;
        forever #5 clk = ~clk;
    end
	 
	 color_changer dut(
		.button_pressed(button_pressed),		// making this a simple 8 bit number to make it easier for testing
		.clk(clk),
		.reset(reset),
		.row(row),
		.col(col),
		.final_color(final_color),
		.done(done)
	 );

	reg [23:0] expected_final_color;
	reg expected_done;
	// I run through pressing 6 buttons, as well as somehow changing the value of the button without
	// it registering that there was a button pressed.
	initial begin
	reset = 1;
	button_pressed = 0;
	row = 0;
	col = 0;
	#30
	$display("Button pressed: %b, button value: %b, final_color: %b, done: %b", button_pressed, 4'h1, final_color, done);
	
	reset = 0;
	button_pressed = 1;
	row = 2;
	col = 3;
	expected_final_color = 24'hc00000;
	expected_done = 0;
	#10
	$display("Button pressed: %b, button value: %b, final_color: %b, expected: %b, done: %b, expected %b,", button_pressed, 4'hc,
	final_color, expected_final_color, done, expected_done);
	
	button_pressed = 0;
	row = 3;
	col = 1;
	expected_final_color = 24'hc00000;
	expected_done = 0;
	#10
	$display("Button pressed: %b, button value: %b, final_color: %b, expected: %b, done: %b, expected %b,", button_pressed, 4'h8,
	final_color, expected_final_color, done, expected_done);
	
	button_pressed = 1;
	row = 1;
	col = 1;
	expected_final_color = 24'hc50000;
	expected_done = 0;
	#10
	$display("Button pressed: %b, button value: %b, final_color: %b, expected: %b, done: %b, expected %b,", button_pressed, 4'h5,
	final_color, expected_final_color, done, expected_done);
	
	button_pressed = 1;
	row = 0;
	col = 3;
	expected_final_color = 24'hc5a000;
	expected_done = 0;
	#10
	$display("Button pressed: %b, button value: %b, final_color: %b, expected: %b, done: %b, expected %b,", button_pressed, 4'ha,
	final_color, expected_final_color, done, expected_done);
	
	button_pressed = 1;
	row = 3;
	col = 0;
	expected_final_color = 24'hc5a000;
	expected_done = 0;
	#10
	$display("Button pressed: %b, button value: %b, final_color: %b, expected: %b, done: %b, expected %b,", button_pressed, 4'h0,
	final_color, expected_final_color, done, expected_done);
	
	button_pressed = 1;
	row = 3;
	col = 3;
	expected_final_color = 24'hc5a0d0;
	expected_done = 0;
	#10
	$display("Button pressed: %b, button value: %b, final_color: %b, expected: %b, done: %b, expected %b,", button_pressed, 4'hd,
	final_color, expected_final_color, done, expected_done);
	
	// Done should be 1 after this because all the values are taken/filled. (count would be 6)
	button_pressed = 1;
	row = 2'd2;
	col = 2'd1;
	expected_final_color = 24'hc5a0d8;
	expected_done = 1;
	#10
	$display("Button pressed: %b, button value: %b, final_color: %b, expected: %b, done: %b, expected %b,", button_pressed, 4'h8,
	final_color, expected_final_color, done, expected_done);
	
	#500
	$stop;
	
	end

endmodule
