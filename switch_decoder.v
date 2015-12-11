module switch_decoder(
	input [7:0] sw,
	output reg [7:0] led_out,
	output reg [2:0] sw_out
);

	// This is essentially an arbiter
	always @(*) begin
		if(sw[7]) begin
			led_out = 8'b10000000;
			sw_out = 3'd7;
		end else if(sw[6]) begin
			led_out = 8'b01000000;
			sw_out = 3'd6;
		end else if(sw[5]) begin
			led_out = 8'b00100000;
			sw_out = 3'd5;
		end else if(sw[4]) begin
			led_out = 8'b00010000;
			sw_out = 3'd4;
		end else if(sw[3]) begin
			led_out = 8'b00001000;
			sw_out = 3'd3;
		end else if(sw[2]) begin
			led_out = 8'b00000100;
			sw_out = 3'd2;
		end else if(sw[1]) begin
			led_out = 8'b00000010;
			sw_out = 3'd1;
		end else begin
			led_out = 8'b00000001;
			sw_out = 3'd0;
		end

	end 

endmodule
