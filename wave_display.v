module wave_display(
	input clk, reset, valid, read_index,
	input [10:0] x,
	input [9:0] y,
	input [7:0] read_value,
	input [3:0] keypad_value,
	input switch,
	input ready,
	output color_changing,
	output [8:0] read_address,
	output valid_pixel,
	output [7:0] r,g,b
);

	color_changer rainbow(
		.clk(clk),
		.reset(reset),
		.value(keypad_value),
		.switch(switch),
		.ready(ready),
		.final_color({r,g,b}),
		.done(color_changing)
	);
  
	// DECLARATIONS
	wire [7:0] trans_y; // translated y
	reg [8:0] read_addr;
	reg valid_x;
	assign read_address = read_addr;	
	always @(*) begin
		case(x[10:8]) // was x
			3'b001: begin
				read_addr = {read_index, 1'b0, x[7:1]};
				valid_x = 1'b1;
			end
			3'b010: begin
				read_addr = {read_index, 1'b1, x[7:1]};
				valid_x = 1'b1;
			end
			default: begin
				read_addr = 9'd0;
				valid_x = 1'b0;
			end
		endcase
	end

	// Keep track of the last address we sent to the RAM 
	wire [8:0] last_addr; // stores the previous read_address
	dffr #(.WIDTH(9)) last_read_addr (
		.clk(clk),
		.r(reset),
		.d(read_address),
		.q(last_addr)
	);
	
	// Keep track of our last sample.  Only change when read_addr changes
	wire [7:0] last_value_unmod; 
	dffre #(.WIDTH(8)) last_read_value (
		.clk(clk),
		.r(reset),
		.d(read_value),
		.q(last_value_unmod),
		.en(last_addr != read_addr)
	);
	// We will want to add 1 to x every time and then if x + 1 = x[10:8] == 10'b0101111111 then nullify it.
	
	
	// This will hold the value of valid so that it is compared with the correct pixel
	wire delayed_valid;
	dffr #(.WIDTH(1)) new_valid(
		.clk(clk), 
		.r(reset),
		.d(valid),
		.q(delayed_valid)
	);
	// This will hold the value of y so that it is compared with the correct pixel
	wire [9:0] delayed_y;
	dffr #(.WIDTH(10)) new_y(
		.clk(clk),
		.r(reset),
		.d(y),
		.q(delayed_y)
	);
	assign trans_y = delayed_y[8:1];
	
	// left edge case
	// if the last addr was valid, keep last_value the way it is.  Otherwise, assign it to our current value
	wire last_addr_valid;
	assign last_addr_valid = (x - 2'd2 > 11'b00100000000);
	wire [7:0] last_value;
	assign last_value = last_addr_valid ? last_value_unmod : read_value;
	
	// right edge case
	wire next_addr_valid;
	assign next_addr_valid = (x + 2'd2 < 11'b01011111111);
	wire [7:0] read_value_mod;
	assign read_value_mod = next_addr_valid ? read_value : last_value;
	
																							
	wire valid_y, valid_wave_pixel;
	assign valid_y = ((last_value <= trans_y) && (trans_y <= read_value_mod)) || ((last_value >= trans_y) && (trans_y >= read_value_mod));
	
	// logic to determine whether we should turn this pixel on as part of the wave display
	assign valid_wave_pixel = valid_x && delayed_valid && !delayed_y[9] && valid_y; // going down or going up

	// logic to determine whether we should turn this pixel on as part of the
	// launchpad display (ld)
	wire [10:0] ld_top_x;
	wire [9:0] ld_top_y;
	wire [7:0] ld_size;
	wire [6:0] ld_grid;
	
	// convert the value of the pressed button to row/column format
	wire [1:0] ld_row, ld_col; // for the pressed button
	launchpad_interface converter(
		.val(keypad_value),
		.row(ld_row),
		.col(ld_col));

	assign ld_top_x = 11'd1000;
	assign ld_top_y = 10'd500;
	assign ld_size = 8'd200;
	assign ld_grid = ld_size >> 2;

	wire valid_row_pixel, valid_col_pixel, valid_grid_pixel, valid_btn_pixel, valid_launch_pixel;
	assign valid_row_pixel = (y == ld_top_y ||
							 y == ld_top_y + ld_grid ||
						 	 y == ld_top_y + (ld_grid << 1'b1) ||
							 y == ld_top_y + ld_size - ld_grid ||
							 y == ld_top_y + ld_size) &&
							 (x >= ld_top_x) &&
							 (x <= ld_top_x + ld_size);
	
	assign valid_col_pixel = (x == ld_top_x ||
							 x == ld_top_x + ld_grid ||
							 x == ld_top_x + (ld_grid << 1'b1) ||
							 x == ld_top_x + ld_size - ld_grid ||
							 x == ld_top_x + ld_size) &&
							 (y >= ld_top_y) &&
							 (y <= ld_top_y + ld_size);

	assign valid_grid_pixel = valid_row_pixel || valid_col_pixel;
	
	// this is WAY too complicated.  Damn multiplication.
	wire[8:0] ld_grid_xlowbound, ld_grid_ylowbound;
	
	multiplier #(.WIDTH(7)) xlowbound (
		.val(ld_grid),
		.mult(ld_col),
		.out(ld_grid_xlowbound));
		
	multiplier #(.WIDTH(7)) ylowbound (
		.val(ld_grid),
		.mult(ld_row),
		.out(ld_grid_ylowbound));
	
	assign valid_btn_pixel = (x > ld_top_x + ld_grid_xlowbound) &&
									 (x < ld_top_x + ld_grid_xlowbound + ld_grid) &&
									 (y > ld_top_y + ld_grid_ylowbound) &&
									 (y < ld_top_y + ld_grid_ylowbound + ld_grid);
	
	assign valid_launch_pixel = valid_grid_pixel || valid_btn_pixel;
	
	assign valid_pixel = valid_wave_pixel || valid_launch_pixel;

	//assign {r,g,b} = 24'hFFFFFF;

endmodule
