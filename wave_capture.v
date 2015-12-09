`define ARMED 	2'd0
`define ACTIVE	2'd1
`define WAIT	2'd2

module wave_capture(
	input clk,
        input reset,
        input new_sample_ready,
        input [15:0] new_sample_in,
        input wave_display_idle,
        output [8:0] write_address,
        output write_enable,
        output [7:0] write_sample,
        output read_index
    );
	wire [1:0] state;
	reg [1:0] next_state;
	wire curr_signed_bit; // This will store the signed bit of the previous sample.
	// This will check our new and old samples to see if there was a positive zero.
	dffr #(1) positive_zero(
		.r(reset),
		.clk(clk),
		.d(new_sample_in[15]),
		.q(curr_signed_bit)
	);
	// This will flip the read_index value every time we switch from `WAIT to `ARMED.
	dffre #(1) index(
		.r(reset),
		.clk(clk),
		.en(wave_display_idle && (state == `WAIT)),
		.d(~read_index),
		.q(read_index)
	);
	// This will keep track of our states.
	dffr #(2) states(
		.clk(clk),
		.r(reset),
		.d(next_state),
		.q(state)
	);

	wire [7:0] counter_out;	//This will take care of itself because after it reaches 255 it will go back to 0.
	// This is our counter for when we are in the `ACTIVE state.
	dffre #(8) counter(
		.r(reset || state != `ACTIVE),
		.clk(clk),
		.d(counter_out + 1'b1),	//counter_in
		.q(counter_out),	//counter_out
		.en(new_sample_ready && state == `ACTIVE)
	);

	assign write_address = {~read_index, counter_out}; 
	assign write_sample = new_sample_in[15:8] + 8'd128;
	assign write_enable = new_sample_ready && (state == `ACTIVE);
	
	always @(*) begin
		case(state)
		`ARMED: 	next_state = (curr_signed_bit > new_sample_in[15]) ? `ACTIVE : `ARMED;
		`ACTIVE: next_state = (counter_out == 8'd255) ? `WAIT : `ACTIVE;
		`WAIT:	next_state = wave_display_idle ? `ARMED : `WAIT;
		default: next_state = `ARMED;
		endcase
	end
	
endmodule
