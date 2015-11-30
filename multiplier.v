// EFFICIENT MULTIPLIER MODULE
// by 'efficient', we mean 'efficient-ish'
// and by 'multiplier', we mean 'multiplier as long as one of the values
// you're trying to multiply by is in [0,3)
	
module multiplier #(
	parameter WIDTH = 8
)(
	input [WIDTH-1:0] val,
	input [1:0] mult,
	output [WIDTH+1:0] out
);
	// NOTE: THIS IS NOWHERE NEAR TECHNICALLY CORRECT
	// We know that.
	// It's basically just a quick hack for our display stuff.  Woops.

	wire [WIDTH+1:0] newval;
	assign newval = val;

	reg [WIDTH+1:0] outval;
	assign out = outval;

	always @(*) begin
		case(mult)
			2'd0: outval = 1'd0;
			2'd1: outval = newval;
			2'd2: outval = newval << 1'b1;
			2'd3: outval = (newval << 1'b1) + newval;
			default: outval = newval;
		endcase
	end
endmodule
