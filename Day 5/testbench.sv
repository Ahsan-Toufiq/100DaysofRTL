module odd_counter_tb();
  logic clk ;
  logic reset ;
  logic[7:0] cnt_o ;
  
  odd_counter ob1(.*) ;
  
  always #1 clk = ~clk;
    
  initial begin
    $dumpfile("dump.vcd") ; 
    $dumpvars(1) ; 
  end

  initial begin
    clk = 1 ;
    reset = 1 ;
    #1 reset = 0 ;
    #5 reset = 1 ;
    #4 reset = 0 ;
    #7 $stop() ;
    #1 $finish() ;
  end 
endmodule
    