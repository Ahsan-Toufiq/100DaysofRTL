// 2x1 MUX

module day1 (a,b,out,select,out);
  input logic [7:0] a;
  input logic [7:0] b;
  input logic select;
  output logic [7:0] out;

  assign out = select ? a : b;

endmodule