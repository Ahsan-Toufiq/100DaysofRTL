module EDC_tb ;
  logic a_i ;
  logic clk ;
  logic reset ; 
  logic rising_edge_o ;
  logic falling_edge_o ;
  //logic both_edge ;
  
  EDC ob1(.clk(clk) ,
          .a_i(a_i) ,
          .reset(reset) ,
          .rising_edge_o(rising_edge_o) ,
          .falling_edge_o(falling_edge_o));
       //   .both_edge(both_edge));
  
  always #1 clk = ~clk ;
  initial begin
    $dumpfile("dump.vcd") ;
    $dumpvars(1) ;
  end
  initial begin
    reset = 0 ;
    clk = 0 ;
    a_i = 0 ;
    #1 a_i = 1 ;
    #1 reset =1 ;
    #7 a_i = 0 ;
    #5 a_i =1 ;
    reset = 0 ;
    #1 a_i =0 ;
    #11 a_i =0 ;
    #9 a_i =1 ;
    #6 a_i =0 ;
    #13 a_i =1 ;
    #7 a_i =0 ;
    #2 a_i =1 ;
    #1 $stop() ;
    #1 $finish() ;
  end
endmodule
    
    