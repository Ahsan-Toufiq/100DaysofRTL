module Bin2GrayCode_tb();
  localparam VEC_W = 4 ;
  logic[VEC_W-1:0]  bin_i  ;
  logic[VEC_W-1:0]  gray_o ;
  
  Bin2GrayCode Day9(.*) ;
  
  initial begin
    $dumpfile("day9.vcd") ;
    $dumpvars(1) ;
  end
  
  initial begin
    for (int y=0 ; y<32 ; y++) begin
      bin_i = $urandom_range(4'h0 , 4'hF) ;
      #1 ;
    end
    #1 $stop() ;
    #1 $finish() ;    
  end
endmodule
  