module Bin2GrayCode(bin_i,gray_o);
  parameter VEC_W = 4 ;
  
  input  logic[VEC_W-1:0]  bin_i  ;
  output logic[VEC_W-1:0]  gray_o ;
  
  assign gray_o[VEC_W-1] = bin_i[VEC_W-1] ;
  
  genvar x ;
  for (x= VEC_W-2 ; x>=0 ; x--) begin
    assign gray_o[x] = bin_i[x+1] ^ bin_i[x] ;
  end
endmodule