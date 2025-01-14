module top(
    input i_Clk,
    input i_Switch_1,
    input i_Switch_2,
    input i_Switch_3,
    input i_Switch_4,
    output o_LED_1,
    output o_LED_2,
    output o_LED_3,
    output o_LED_4,
);
    reg r_LED_1    = 1'b0;
    reg r_Switch_1 = 1'b0;
    reg r_LED_2    = 1'b0;
    reg r_Switch_2 = 1'b0;
    reg r_LED_3    = 1'b0;
    reg r_Switch_3 = 1'b0;
    reg r_LED_4    = 1'b0;
    reg r_Switch_4 = 1'b0;

    always @(posedge i_Clk)
    begin
      r_Switch_1 <= i_Switch_1;
      r_Switch_2 <= i_Switch_2;
      r_Switch_3 <= i_Switch_3;
      r_Switch_4 <= i_Switch_4;

      if (i_Switch_1 == 1'b0 && r_Switch_1 == 1'b1)
      begin
        r_LED_1 <= ~r_LED_1;
      end
      if (i_Switch_2 == 1'b0 && r_Switch_2 == 1'b1)
      begin
        r_LED_2 <= ~r_LED_2;
      end
      if (i_Switch_3 == 1'b0 && r_Switch_3 == 1'b1)
      begin
        r_LED_3 <= ~r_LED_3;
      end
      if (i_Switch_4 == 1'b0 && r_Switch_4 == 1'b1)
      begin
        r_LED_4 <= ~r_LED_4;
      end
    end

    assign o_LED_1 = r_LED_1;
    assign o_LED_2 = r_LED_2;
    assign o_LED_3 = r_LED_3;
    assign o_LED_4 = r_LED_4;
endmodule
