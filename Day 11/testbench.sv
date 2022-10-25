module ParallelToSerialShifter_tb();
  logic clk, reset, serial_o, valid_o, empty_o ;
  logic[3:0] parallel_i ;
  
  ParallelToSerialShifter Day11(.*) ;
  
  always #1 clk = ~clk ;
  initial begin
    $dumpfile("day11.vcd") ;
    $dumpvars(1) ;
  end
  
  initial begin
    clk =   0         ;
    reset = 1         ;
    parallel_i = 4'h0 ;
    
    for (int x=0 ; x<2 ; x++) begin
      #3 reset = ~reset ;
      
      for(int y=0 ; y<3 ; y++) begin
        parallel_i = $urandom_range(4'h0 , 4'hf) ;
        #15 ;
      end
      #5 reset = ~reset ;
    end
    #1 $stop()   ;
    #1 $finish() ;
  end
endmodule
        
      
    	  
      