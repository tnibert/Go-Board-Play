module Binary_To_7Segment(
  input i_Clk,
  input [3:0] i_Binary_Num,
  output o_Segment_A,
  output o_Segment_B,
  output o_Segment_C,
  output o_Segment_D,
  output o_Segment_E,
  output o_Segment_F,
  output o_Segment_G
);

  reg [6:0] r_Encoding;
  
  always @(posedge i_Clk)
    begin
      case (i_Binary_Num)
        4'b0000 : r_Encoding <= 7'b1111110; // 0
        4'b0001 : r_Encoding <= 7'b0110000; // 1
        4'b0010 : r_Encoding <= 7'b1101101; // 2
        4'b0011 : r_Encoding <= 7'b1111001; // 3
        4'b0100 : r_Encoding <= 7'b0110011; // 4
        4'b0101 : r_Encoding <= 7'b1011011; // 5
        4'b0110 : r_Encoding <= 7'b1011111; // 6
        4'b0111 : r_Encoding <= 7'b1110000; // 7
        4'b1000 : r_Encoding <= 7'b1111111; // 8
        4'b1001 : r_Encoding <= 7'b1111011; // 9
        //4'b1010 : r_Encoding <= 7'b1110111; // A
        default : r_Encoding <= 7'b1001111; // E for error
      endcase
    end

    assign o_Segment_A = r_Encoding[6];
    assign o_Segment_B = r_Encoding[5];
    assign o_Segment_C = r_Encoding[4];
    assign o_Segment_D = r_Encoding[3];
    assign o_Segment_E = r_Encoding[2];
    assign o_Segment_F = r_Encoding[1];
    assign o_Segment_G = r_Encoding[0];
endmodule