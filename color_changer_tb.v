module color_changer_tb();
	
	reg button_pressed;
	reg clk;
	reg reset;
	reg [3:0] button;		// May not have this?? SIPMLIFYING FOR TESTING
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
		.button
	 );

	reg [23:0] expected_final_color;
	reg expected_done;
	// I run through pressing 6 buttons, as well as somehow changing the value of the button without
	// it registering that there was a button pressed.
	initial begin
	reset = 1;
	button_pressed = 0;
	button = 4'h0;
	#30
	$display("Button pressed: %b, button value: %b, final_color: %b, done: %b", button_pressed, button, final_color, done);
	
	reset = 0;
	button_pressed = 1;
	button = 4'hc;
	expected_final_color = 6'hc00000;
	expected_done = 0;
	#10
	$display("Button pressed: %b, button value: %b, final_color: %b, expected: %b, done: %b, expected %b,", button_pressed, button,
	final_color, expected_final_color, done, expected_done);
	
	button_pressed = 0;
	button = 4'hf;
	expected_final_color = 6'hc00000;
	expected_done = 0;
	#10
	$display("Button pressed: %b, button value: %b, final_color: %b, expected: %b, done: %b, expected %b,", button_pressed, button,
	final_color, expected_final_color, done, expected_done);
	
	button_pressed = 1;
	button = 4'h5;
	expected_final_color = 6'hc50000;
	expected_done = 0;
	#10
	$display("Button pressed: %b, button value: %b, final_color: %b, expected: %b, done: %b, expected %b,", button_pressed, button,
	final_color, expected_final_color, done, expected_done);
	
	button_pressed = 1;
	button = 4'ha;
	expected_final_color = 6'hc5a000;
	expected_done = 0;
	#10
	$display("Button pressed: %b, button value: %b, final_color: %b, expected: %b, done: %b, expected %b,", button_pressed, button,
	final_color, expected_final_color, done, expected_done);
	
	button_pressed = 1;
	button = 4'h0;
	expected_final_color = 6'hc5a000;
	expected_done = 0;
	#10
	$display("Button pressed: %b, button value: %b, final_color: %b, expected: %b, done: %b, expected %b,", button_pressed, button,
	final_color, expected_final_color, done, expected_done);
	
	button_pressed = 1;
	button = 4'hd;
	expected_final_color = 6'hc5a0d0;
	expected_done = 0;
	#10
	$display("Button pressed: %b, button value: %b, final_color: %b, expected: %b, done: %b, expected %b,", button_pressed, button,
	final_color, expected_final_color, done, expected_done);
	
	// Done should be 1 after this because all the values are taken/filled. (count would be 6)
	button_pressed = 1;
	button = 4'h8;
	expected_final_color = 6'hc5a0d8;
	expected_done = 1;
	#10
	$display("Button pressed: %b, button value: %b, final_color: %b, expected: %b, done: %b, expected %b,", button_pressed, button,
	final_color, expected_final_color, done, expected_done);
	
	end

endmodule
