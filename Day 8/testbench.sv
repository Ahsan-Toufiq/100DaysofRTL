module bin2OneHot_tb() ;
  localparam BIN_W = 4 ;
  localparam ONE_HOT_W = 16 ;
  
  logic[BIN_W -1:0] bin_i ;
  logic[ONE_HOT_W -1:0] one_hot_o ;
  
  bin2OneHot day8(.*) ;
  
  initial begin
    $dumpfile("day8.vcd") ;
    $dumpvars(1) ;
  end
  
  initial begin
    for(int x=0; x<32; x++) begin
      bin_i = $urandom_range(0, 4'hF);
      #1;
    end
    #1 $stop() ;
    #1 $finish();
  end
    
endmodule
    