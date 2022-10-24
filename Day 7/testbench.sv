module LFSR_tb();
  logic clk ;
  logic reset ;
  logic[3:0] lfsr_o ;
  
  LFSR Day7(.*) ;
  
  always #1 clk = ~clk ;
  
  initial begin
    $dumpfile("day7.vcd") ;
    $dumpvars(1) ;
  end
  
  initial begin
    clk = 1 ;
    reset = 1 ;
    #4 reset = 0 ;
    #17 reset = 1 ;
    #1 reset = 0 ;    
    #25 $stop() ;
    #1 $finish() ;
  end
endmodule