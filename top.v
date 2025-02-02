module top(
  input  i_Clk,
  input  i_Switch_1,
  input  i_Switch_2,
  input  i_Switch_3,
  input  i_Switch_4,
  output o_LED_1,
  output o_LED_2,
  output o_LED_3,
  output o_LED_4,
  // 7 segment display
  output o_Segment2_A,
  output o_Segment2_B,
  output o_Segment2_C,
  output o_Segment2_D,
  output o_Segment2_E,
  output o_Segment2_F,
  output o_Segment2_G
);

  localparam CLKS_PER_SEC   = 25000000; // 25 MHz clock
  localparam DEBOUNCE_LIMIT = 250000;   // 10 ms debounce filter

  wire w_Segment2_A, w_Segment2_B, w_Segment2_C, w_Segment2_D;
  wire w_Segment2_E, w_Segment2_F, w_Segment2_G;
  wire [3:0] w_Count;

  Timed_Counter #(.CYCLES_PER_SEC(CLKS_PER_SEC)) Timed_Counter_Inst
  (
    .i_Clk(i_Clk),
    .o_Count(w_Count)
  );

  Binary_To_7Segment Binary_To_7Segment_Inst
  (
    .i_Clk(i_Clk),
    .i_Binary_Num(w_Count),
    .o_Segment_A(w_Segment2_A),
    .o_Segment_B(w_Segment2_B),
    .o_Segment_C(w_Segment2_C),
    .o_Segment_D(w_Segment2_D),
    .o_Segment_E(w_Segment2_E),
    .o_Segment_F(w_Segment2_F),
    .o_Segment_G(w_Segment2_G)
  );

  Debounced_LED_Toggle #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) Debounce_LED_1_Inst
  (
    .i_Clk(i_Clk),
    .i_Switch(i_Switch_1),
    .o_LED(o_LED_1)
  );
  Debounced_LED_Toggle #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) Debounce_LED_2_Inst
  (
    .i_Clk(i_Clk),
    .i_Switch(i_Switch_2),
    .o_LED(o_LED_2)
  );
  Debounced_LED_Toggle #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) Debounce_LED_3_Inst
  (
    .i_Clk(i_Clk),
    .i_Switch(i_Switch_3),
    .o_LED(o_LED_3)
  );
  Debounced_LED_Toggle #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) Debounce_LED_4_Inst
  (
    .i_Clk(i_Clk),
    .i_Switch(i_Switch_4),
    .o_LED(o_LED_4)
  );

  assign o_Segment2_A = !w_Segment2_A;
  assign o_Segment2_B = !w_Segment2_B;
  assign o_Segment2_C = !w_Segment2_C;
  assign o_Segment2_D = !w_Segment2_D;
  assign o_Segment2_E = !w_Segment2_E;
  assign o_Segment2_F = !w_Segment2_F;
  assign o_Segment2_G = !w_Segment2_G;

endmodule

module Debounced_LED_Toggle #(parameter DEBOUNCE_LIMIT = 20) (
  input  i_Clk,
  input  i_Switch,
  output o_LED
) ;
  wire w_Debounced_Switch;

  // 250000 cycles for Go Board
  Debounce_Filter #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) Debounce_Inst
  (.i_Clk(i_Clk),
   .i_Bouncy(i_Switch),
   .o_Debounced(w_Debounced_Switch));
  
  LED_Toggle LED_Toggle_Inst
  (.i_Clk(i_Clk),
   .i_Switch(w_Debounced_Switch),
   .o_LED(o_LED));
endmodule
