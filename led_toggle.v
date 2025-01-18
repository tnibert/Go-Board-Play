module LED_Toggle(
  input  i_Clk,
  input  i_Switch,
  output o_LED
);
  reg r_LED    = 1'b0;
  reg r_Switch = 1'b0;

  always @(posedge i_Clk)
  begin
    r_Switch <= i_Switch;

    if (i_Switch == 1'b0 && r_Switch == 1'b1)
    begin
      r_LED <= ~r_LED;
    end
  end

  assign o_LED = r_LED;
endmodule
