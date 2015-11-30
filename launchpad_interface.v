module launchpad_interface(
	input [3:0] val,	
	output [1:0] row,
	output [1:0] col
);

	reg [1:0] x,y;
	assign row = x;
	assign row = y;
	
	always @(*) begin
		case({row, col})
			4'b0000: begin
				// 0
				x = 2'd0;
				y = 2'd3;
			end
			4'b0001: begin
				// 1
				x = 2'd0;
				y = 2'd0;
			end
			4'b0010: begin
				// 2
				x = 2'd1;
				y = 2'd0;
			end
			4'b0011: begin
				// 3
				x = 2'd2;
				y = 2'd0;
			end
			4'b0100: begin
				// 4
				x = 2'd0;
				y = 2'd1;
			end
			4'b0101: begin
				// 5
				x = 2'd1;
				y = 2'd1;
			end
			4'b0110: begin
				// 6
				x = 2'd2;
				y = 2'd1;
			end
			4'b0111: begin
				// 7	
				x = 2'd0;
				y = 2'd2;
			end
			4'b1000: begin
				// 8
				x = 2'd1;
				y = 2'd1;
			end
			4'b1001: begin
				// 9
				x = 2'd2;
				y = 2'd2;
			end
			4'b1010: begin
				// A
				x = 2'd3;
				y = 2'd0;
			end
			4'b1011: begin
				// B
				x = 2'd3;
				y = 2'd1;
			end
			4'b1100: begin
				// C
				x = 2'd3;
				y = 2'd2;
			end
			4'b1101: begin
				// D
				x = 2'd3;
				x = 2'd3;
			end
			4'b1110: begin
				// E
				x = 2'd2;
				y = 2'd3;
			end
			4'b1111: begin
				// F
				x = 2'd1;
				y = 2'd3;
			end
			default: begin
				x = 2'd0;
				y = 2'd0;
			end
		endcase
	end

endmodule	
