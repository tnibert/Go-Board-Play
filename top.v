module top(
  input  i_Clk,
  input  i_Switch_1,
  input  i_Switch_2,
  input  i_Switch_3,
  input  i_Switch_4,
  output o_LED_1,
  output o_LED_2,
  output o_LED_3,
  output o_LED_4
);
  Debounced_LED_Toggle Debounce_LED_1_Inst
  (.i_Clk(i_Clk),
   .i_Switch(i_Switch_1),
   .o_LED(o_LED_1)
  );
  Debounced_LED_Toggle Debounce_LED_2_Inst
  (.i_Clk(i_Clk),
   .i_Switch(i_Switch_2),
   .o_LED(o_LED_2)
  );
  Debounced_LED_Toggle Debounce_LED_3_Inst
  (.i_Clk(i_Clk),
   .i_Switch(i_Switch_3),
   .o_LED(o_LED_3)
  );
  Debounced_LED_Toggle Debounce_LED_4_Inst
  (.i_Clk(i_Clk),
   .i_Switch(i_Switch_4),
   .o_LED(o_LED_4)
  );
endmodule

module Debounced_LED_Toggle(
  input  i_Clk,
  input  i_Switch,
  output o_LED
);
  wire w_Debounced_Switch;

  // 250000 cycles for Go Board
  Debounce_Filter #(.DEBOUNCE_LIMIT(250000)) Debounce_Inst
  (.i_Clk(i_Clk),
   .i_Bouncy(i_Switch),
   .o_Debounced(w_Debounced_Switch));
  
  LED_Toggle LED_Toggle_Inst
  (.i_Clk(i_Clk),
   .i_Switch(w_Debounced_Switch),
   .o_LED(o_LED));
endmodule
