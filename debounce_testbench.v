module Debounce_Filter_TB ();
  reg r_Clk = 1'b0, r_Bouncy = 1'b0;
  wire w_Debounced;
  always #2 r_Clk <= !r_Clk;

  Debounce_Filter #(.DEBOUNCE_LIMIT(4)) UUT
  (.i_Clk(r_Clk),
   .i_Bouncy(r_Bouncy),
   .o_Debounced(w_Debounced));

  initial begin
    $dumpfile("dump.vcd"); $dumpvars;

    repeat(3) @(posedge r_Clk);
    r_Bouncy <= 1'b1;

    @(posedge r_Clk);
    r_Bouncy <= 1'b0;

    @(posedge r_Clk);
    r_Bouncy <= 1'b1;

    repeat(6) @(posedge r_Clk);
    $display("Test Complete");
    $finish();
  end
endmodule
