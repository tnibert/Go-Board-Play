module top(
  input  i_Clk,
  input  i_Switch_1,
  /*input  i_Switch_2,
  input  i_Switch_3,
  input  i_Switch_4,*/
  output o_LED_1
  /*output o_LED_2,
  output o_LED_3,
  output o_LED_4*/
);
  wire w_Debounced_Switch;

  Debounce_Filter #(.DEBOUNCE_LIMIT(250000)) Debounce_Inst
  (.i_Clk(i_Clk),
   .i_Bouncy(i_Switch_1),
   .o_Debounced(w_Debounced_Switch));
  
  LED_Toggle LED_Toggle_Inst
  (.i_Clk(i_Clk),
   .i_Switch(w_Debounced_Switch),
   .o_LED(o_LED_1));

endmodule
