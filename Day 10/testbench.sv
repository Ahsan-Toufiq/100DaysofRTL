module reloadingCounter_tb() ;
  logic clk             ;
  logic reset           ;
  logic load_i          ;
  logic[3:0] load_val_i ;
  logic[3:0] count_o    ;
  
  reloadingCounter day10(.*) ;
  
  always #1 clk = ~clk ;
  
  initial begin
    $dumpfile("day10.vcd") ;
    $dumpvars(1) ;
  end
  
  initial begin
    clk = 1      ;
    reset = 1    ;
    load_i = 1   ;
    #1 reset = 0 ;
    for (int x=0 ; x<4 ; x++) begin
      load_i = ~load_i ; //$random%2 ;
      for(int y=0 ; y<32 ; y++) begin
        load_val_i = $urandom_range(4'h0 , 4'hf) ;
        #1 ;
      end
    end
    #1 $stop()   ;
    #1 $finish() ;
  end
endmodule
      
      