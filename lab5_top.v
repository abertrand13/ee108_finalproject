module lab5_top(
    /*
	 'define H_SYNC_PULSE 112
	 'define H_BACK_PORCH 248
	 'define H_FRONT_PORCH 48
	 'define V_SYNC_PULSE 3
	 'define V_BACK_PORCH 38
	 'define V_FRONT_PORCH 1
*/ 	 
	 
	 // Clock
    input clk,
	 
	 
    // ADAU_1761 interface
    output  AC_ADR0,            // I2C Address pin (DO NOT CHANGE)
    output  AC_ADR1,            // I2C Address pin (DO NOT CHANGE)

    output  AC_GPIO0,           // I2S Signals
    input   AC_GPIO1,           // I2S Signals
    input   AC_GPIO2,           // I2S Byte Clock
    input   AC_GPIO3,           // I2S Channel Clock

    output  AC_MCLK,            // Master clock (48MHz)
    output  AC_SCK,             // I2C SCK
    inout   AC_SDA,             // I2C SDA 

    // LEDs
    output wire [7:0] leds,
	 
	// DIP Switches
	input [7:0] sw,
	
    // DVI Interface
    
    // I2C
    inout  scl,
    inout  sda,
	 
	output hdmi_clock,
	output hdmi_hsync,
	output hdmi_vsync,
	output [15:0] hdmi_d,
	output hdmi_de, 
	input hdmi_int, 
	 
    input btn_up,
    input btn_left,
    input btn_right,
    input btn_down,
	 
	// JB Pmod interfce
	inout [7:0] JB
);  
    // button_press_unit's WIDTH parameter is exposed here so that you can
    // reduce it in simulation.  Setting it to 1 effectively disables it.
    parameter BPU_WIDTH = 20; // Started at 20 *******************
    // The BEAT_COUNT is parameterized so you can reduce this in simulation.
    // If you reduce this to 100 your simulation will be 10x faster.
    parameter BEAT_COUNT = 1000; // Started at 1000 *******************

    // Our reset
    wire reset = btn_up;
   
    // These signals are for determining which color to display
    wire [10:0] x;  // [0..1279]
    wire [10:0]  y;  // [0..1023]   
    wire [10:0] x_q;
    wire [10:0] y_q; 	 
    // Color to display at the given x,y
    wire [7:0]  r, g, b;
	wire [3:0] keypad_value;
	wire color_changing;	// Used to determine when we are changing the color of the waveform. True when we are done changing... 
 
//   
//  ****************************************************************************
//      Button processor units
//  ****************************************************************************
//  
    wire switch;	// We should probably set this to always be true and use
					// this vv for switching to set color.
    button_press_unit #(.WIDTH(BPU_WIDTH)) play_button_press_unit(
        .clk(clk),
        .reset(reset),
        .in(btn_left),
        .out(switch)
    );

    wire ready; // Change this so that it goes true when we hit a button
					// on the keypad.
    button_press_unit #(.WIDTH(BPU_WIDTH)) next_button_press_unit(
        .clk(clk),
        .reset(reset),
        .in(btn_right),
        .out(ready)
    );
       
//   
//  ****************************************************************************
//      The music player
//  ****************************************************************************
//       
    wire new_frame;
    wire [15:0] codec_sample, flopped_sample;
    wire new_sample, flopped_new_sample;
	
	wire [2:0] switch_out;
	
    music_player #(.BEAT_COUNT(BEAT_COUNT)) music_player(
        .clk(clk),
        .reset(reset),
        .play_button(switch),
        .next_button(ready),
        .new_frame(new_frame),
			.sw_value(switch_out),
        .sample_out(codec_sample),
        .new_sample_generated(new_sample),
		.keypad_value(keypad_value),
		.color_changing(color_changing)
    );
    dff #(.WIDTH(17)) sample_reg (
        .clk(clk),
        .d({new_sample, codec_sample}),
        .q({flopped_new_sample, flopped_sample})
    );

//   
//  ****************************************************************************
//      Codec interface
//  ****************************************************************************
//  

	wire [23:0] hphone_r = 0;
	wire [23:0] line_in_l = 0;  
	wire [23:0] line_in_r =  0; 

    adau1761_codec adau1761_codec(
        .clk_100(clk),
        .reset(reset),
        .AC_ADR0(AC_ADR0),
        .AC_ADR1(AC_ADR1),
        .I2S_MISO(AC_GPIO0),
        .I2S_MOSI(AC_GPIO1),
        .I2S_bclk(AC_GPIO2),
        .I2S_LR(AC_GPIO3),
        .AC_MCLK(AC_MCLK),
        .AC_SCK(AC_SCK),
        .AC_SDA(AC_SDA),
        .hphone_l({codec_sample, 8'h00}),
        .hphone_r(hphone_r),
        .line_in_l(line_in_l),
        .line_in_r(line_in_r),
        .new_sample(new_frame)
    );

//
//  ****************************************************************************
//		  Launchpad interface
//  ****************************************************************************
//  
	 
	 // Instantiate module to read keypresses
	 keypad_decoder key_dec(
		  .clk(clk),
		  .Row(JB[7:4]),
		  .Col(JB[3:0]),
		  .DecodeOut(keypad_value));
		  
//
//  ****************************************************************************
//		  Switch interface
//  ****************************************************************************
//  
	
	switch_decoder switch_dec(
		.sw(sw),
		.led_out(leds),
		.sw_out(switch_out)
		);
    
//   
//  ****************************************************************************
//      Display management
//  ****************************************************************************
//  
    /* blinking leds to show life */
    wire [26:0] led_counter;

    dff #(.WIDTH (27)) led_div (
        .clk (clk),
        .d (led_counter + 27'd1),
        .q (led_counter)
    );
    // assign leds_l = led_counter[26:23];
 
    //==========================================================================
    // Display management -> do not touch!
    //==========================================================================
	 
	 wire valid; 
	 
	 wire [20:0] yeblah;
	 wire [20:0] cbblah; 
	 wire [20:0] crblah; 
	 
	 wire [20:0] yeblah_q;
	 wire [20:0] cbblah_q; 
	 wire [20:0] crblah_q; 
	 
    assign yeblah = 63*b + 629*g + 187*r + 16384; //multiply by 1024 
    assign cbblah = 450*b - 347*g - 103*r + 131072;	 
	 assign crblah = -41*b -409*g +450*r + 131072; 
	 
	 dff #(.WIDTH (21)) ye_dff (
        .clk (clk),
        .d (yeblah),
        .q (yeblah_q)	 
    );
		  
    dff #(.WIDTH (21)) cb_dff (
        .clk (clk),
        .d (cbblah),
        .q (cbblah_q)
    );
		  
	 dff #(.WIDTH (21)) cr_dff (
        .clk (clk),
        .d (crblah),
        .q (crblah_q)
	 );

	 reg [7:0] ye;
	 reg [7:0] cb; 
	 reg [7:0] cr; 
	 
	 always @ (posedge clk) begin  
		  ye [7:0] = (yeblah_q[20]) ? 0 : ( (yeblah_q >= 20'hFFFFF)? 10'h3FF: yeblah_q[19:10] );
		  cb [7:0] = (cbblah_q[20]) ? 0 : ( (cbblah_q >= 20'hFFFFF)? 10'h3FF: cbblah_q[19:10] );
		  cr [7:0] = (crblah_q[20]) ? 0 : ( (cbblah_q >= 20'hFFFFF)? 10'h3FF: crblah_q[19:10] );
		  converted = {ye,cb,cr};
	 end 
	
	 reg [23:0] converted;
    //assign converted = {ye,cb,cr};	
    //HDMI Controller 
	 zedboard_hdmi hdmi (
			 .clk_100 (clk),
			 .hdmi_clk (hdmi_clock), 
			 .hdmi_hsync (hdmi_hsync),
	       .hdmi_vsync (hdmi_vsync), 
	       .hdmi_d (hdmi_d), 
	       .hdmi_de (hdmi_de),  
	       .hdmi_int (hdmi_int), 
	       .hdmi_scl (scl), 
          .hdmi_sda (sda),
			 .xpos (x),
			 .ypos (y),
			 .ycbcr (converted), 
			 .valid (valid)
    );			 
    
	 dff #(.WIDTH (11)) x_dff (
        .clk (clk),
        .d (x),
        .q (x_q)
		  );
 
	 dff #(.WIDTH (11)) y_dff (
        .clk (clk),
        .d (y),
        .q (y_q)
		  );
		   
    wave_display_top wd_top (
		.clk (clk),
		.reset (reset),
		.new_sample (new_sample),
		.sample (flopped_sample),
		.x(x_q),
		.y(y_q),
		.valid(valid),
		.vsync(hdmi_vsync),
		.keypad_value(keypad_value),
		.sw_value(switch_out),
		.switch(switch),
		.ready(ready),
		.color_changing(color_changing),
		.r(r),
		.g(g),
		.b(b)
    );
	 

endmodule

