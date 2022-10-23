module DFLipFLop_tb ;
  logic clk ;
  logic reset ; 
  logic d_i ; 
  logic q_syncrst_o ;
  logic q_asyncrst_o ;
  logic q_norst_o ;
  
  DFlipFlop ob1(.clk(clk),
                .reset(reset),
                .d_i(d_i),
                .q_syncrst_o(q_syncrst_o),
                .q_asyncrst_o(q_asyncrst_o),
                .q_norst_o(q_norst_o));
  
  always #1 clk = ~clk ;
  initial begin
    $dumpfile("dump.vcd") ; 
    $dumpvars(1) ; 
  end
  initial begin    
    clk = 1 ;
    d_i = 0 ;
    reset = 0 ; 
    #1 d_i = 1 ;
    #1 d_i = 1 ;
    #1 d_i = 0 ;
    #1 d_i = 1 ;
    #2 reset = 1 ;
    #2 $stop() ;
    #1 $finish ;
  end
endmodule
  