module Timed_Counter #(parameter CYCLES_PER_SEC = 25000000) (
  input  i_Clk,
  output [3:0] o_Count
);

  reg [$clog2(CYCLES_PER_SEC)-1:0] r_Track = 0;
  reg [3:0] r_Count                        = 4'b0000;

  always @(posedge i_Clk)
  begin
    if (r_Track < CYCLES_PER_SEC - 1)
    begin
      r_Track <= r_Track + 1;
    end
    else if (r_Track == CYCLES_PER_SEC - 1 && r_Count < 9)
    begin
      r_Count <= r_Count + 1;
      r_Track <= 0;
    end
    else
    begin
      r_Count <= 4'b0000;
      r_Track <= 0;
    end
  end

  assign o_Count = r_Count;

endmodule