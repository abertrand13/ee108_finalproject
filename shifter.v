module shifter (
	input [2:0] in,
	input [1:0] shift,
	output [2:0] out
);
	
	assign out = $signed(in) >>> shift;

endmodule
