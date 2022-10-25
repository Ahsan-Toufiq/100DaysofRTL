module FPA_tb() ;
  localparam NUM_PORTS = 4   ;
  logic[NUM_PORTS-1:0] req_i ;
  logic[NUM_PORTS-1:0] gnt_o ;
  
  FPA Day14(.*) ;
  
  initial begin
    $dumpfile("day14.vcd") ;
    $dumpvars(1)           ;
  end
  
  initial begin
    for (int x=0 ; x<32 ; x++) begin
      req_i = $urandom_range(4'h0 , 4'hf) ;
      #1 ; 
    end
    #1 $stop()   ;
    #1 $finish() ;
  end
endmodule
  