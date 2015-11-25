// Test Bench for song_reader module
//
// TODO: ATM this is failing a bunch of the tests due to timing offsets.  I'm going
// to leave it for now because we had something that was just about working
// before, but I definitely need to revisit this.

module song_reader_tb();
  
  // DECLARATIONS
  reg clk, reset, play, note_done;
  reg [1:0] song;
  wire [5:0] note;
  wire [5:0] duration;
  wire song_done, new_note;
  reg [191:0] exp_notes1, exp_durations1, exp_notes2, exp_durations2,
				  exp_notes3, exp_durations3, exp_notes4, exp_durations4;;
  reg [5:0] exp_note, exp_duration;
  integer i;

  // INSTANTIATIONS
  song_reader dut (
    .clk(clk),
    .reset(reset),
    .play(play),
    .note_done(note_done),
    .song(song),
    .song_done(song_done),
    .new_note(new_note),
    .note(note),
    .duration(duration));

  // Clock control
  initial begin
    clk = 1'b0;
    reset = 1'b1;
    repeat (4) #5 clk = ~clk;
    reset = 1'b0;
    forever #5 clk = ~clk;
  end

  // Tests
  initial begin
    #20

    // Request notes of the first song
    song = 2'b00;
    play = 1;
    note_done = 0;
    exp_notes1 = {6'd0, 6'd0, 6'd37, 6'd37, 6'd35, 6'd23, 6'd33, 6'd21, 6'd32, 6'd20, 6'd30, 6'd18, 6'd28, 6'd16, 6'd27, 6'd15, 6'd25, 6'd13, 6'd11, 6'd59, 6'd9, 6'd57, 6'd8, 6'd56, 6'd6, 6'd54, 6'd4, 6'd52, 6'd3, 6'd51, 6'd1, 6'd49}; 
    exp_durations1 = {6'd0, 6'd0, 6'd0, 6'd0, 6'd8, 6'd12, 6'd8, 6'd12, 6'd8, 6'd12, 6'd8, 6'd12, 6'd8, 6'd12, 6'd8, 6'd12, 6'd8, 6'd12, 6'd8, 6'd12, 6'd8, 6'd12, 6'd8, 6'd12, 6'd8, 6'd12, 6'd8, 6'd12, 6'd8, 6'd12, 6'd8, 6'd12}; 
    
    
    $display("BEGINNING SONG 1");
    for(i = 0;i < 32; i= i+1) begin
      #10 exp_note = exp_notes1[i*6+:6];
      $display("note: %b -- expected: %b -- test %s", note, exp_note, (note == exp_note) ? "passed" : "FAILED");
      exp_duration = exp_durations1[i*6+:6];
      $display("duration: %b -- expected: %b -- test %s", duration, exp_duration, (duration == exp_duration) ? "passed" : "FAILED");
      
      // wait a cycle for note_player to return and then send note_done high
      #10 note_done = 1;
      #10 note_done = 0;
    end
    $display("END OF SONG 1");

    song = 2'b01;
    exp_notes2 = {6'd42, 6'd30, 6'd37, 6'd35, 6'd37, 6'd38, 6'd37, 6'd30, 6'd37, 6'd35, 6'd30, 6'd35, 6'd30, 6'd37, 6'd35, 6'd37, 6'd38, 6'd30, 6'd37, 6'd30, 6'd35, 6'd30, 6'd37, 6'd34, 6'd35, 6'd37, 6'd38, 6'd35, 6'd37, 6'd38, 6'd42, 6'd35};
    exp_durations2 = {6'd9, 6'd9, 6'd9, 6'd9, 6'd9, 6'd18, 6'd9, 6'd9, 6'd18, 6'd9, 6'd9, 6'd18, 6'd18, 6'd18, 6'd9, 6'd9, 6'd18, 6'd18, 6'd18, 6'd18, 6'd18, 6'd36, 6'd18, 6'd18, 6'd18, 6'd18, 6'd18, 6'd18, 6'd18, 6'd54, 6'd36, 6'd36};
    
    $display("BEGINNING SONG 2");
    for(i = 0;i < 32;i = i+1) begin
      #10 exp_note = exp_notes2[i*6+:6];
      $display("note: %b -- expected: %b -- test %s", note, exp_note, (note == exp_note) ? "passed" : "FAILED");
      exp_duration = exp_durations2[i*6+:6];
      $display("duration: %b -- expected: %b -- test %s", duration, exp_duration, (duration == exp_duration) ? "passed" : "FAILED");
      
      // wait a cycle for note_player to return and then send note_done high
      #10 note_done = 1;
      #10 note_done = 0;
    end
    $display("END OF SONG 2");

	  song = 2'b10;
    exp_notes3 = {6'd0, 6'd47,6'd46, 6'd0, 6'd44, 6'd43, 6'd0, 6'd44, 6'd42, 6'd44, 6'd47, 6'd49, 6'd50, 6'd51, 6'd0, 6'd47, 6'd44, 6'd0, 6'd51, 6'd52, 6'd0, 6'd47, 6'd46, 6'd0, 6'd44, 6'd43, 6'd0, 6'd47, 6'd46, 6'd0, 6'd44, 6'd43};
    exp_durations3 = {6'd26, 6'd16, 6'd6, 6'd28, 6'd14, 6'd6, 6'd60, 6'd40, 6'd8, 6'd8, 6'd8, 6'd8, 6'd56, 6'd6, 6'd10, 6'd8, 6'd6, 6'd10, 6'd8, 6'd6, 6'd10, 6'd8, 6'd6, 6'd10, 6'd8, 6'd6, 6'd34, 6'd8, 6'd6, 6'd34, 6'd8, 6'd6};

    
    $display("BEGINNING SONG 3");
    for(i = 0;i < 32;i = i+1) begin
      #10 exp_note = exp_notes3[i*6+:6];
      $display("note: %b -- expected: %b -- test %s", note, exp_note, (note == exp_note) ? "passed" : "FAILED");
      exp_duration = exp_durations3[i*6+:6];
      $display("duration: %b -- expected: %b -- test %s", duration, exp_duration, (duration == exp_duration) ? "passed" : "FAILED");
      
      // wait a cycle for note_player to return and then send note_done high
      #10 note_done = 1;
      #10 note_done = 0;
    end
    $display("END OF SONG 3");
 
	$stop;
    // $finish;
  end

endmodule
