module shifter_tb();
	
	reg [2:0] in;
	reg [1:0] shift;
	wire [2:0] out;
	
	shifter datShiftDoe (
		.in(in),
		.shift(shift),
		.out(out));
	
	initial begin
		#10	
		in = 3'b110;
		shift = 1'b1;
		$display("Output = %d", out);
		#50

		$stop;
	end

endmodule
