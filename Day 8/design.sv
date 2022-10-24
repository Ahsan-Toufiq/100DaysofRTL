module bin2OneHot(bin_i , one_hot_o); 
  parameter BIN_W     = 4  ;
  parameter ONE_HOT_W = 16 ;
  
  input logic[BIN_W-1 :0] bin_i         ;        
  output logic[ONE_HOT_W-1 :0] one_hot_o ;

  assign one_hot_o = 1'b1<<bin_i ;

endmodule


    