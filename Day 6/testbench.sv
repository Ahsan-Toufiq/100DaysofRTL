module shift_reg_tb();
  logic clk ;
  logic reset ;
  logic x_i ;
  logic[3:0] sr_o ;

  shift_register ob1(.*) ;
  
  always #1 clk = ~clk ;
  
  initial begin
    $dumpfile("dump.vcd") ; 
    $dumpvars(1) ; 
  end

  initial begin
    clk = 1 ;
    reset <= 1 ;
    x_i <= 0 ;
    @(posedge clk) ;
    reset <= 0 ;
    @(posedge clk) ;
    for (int t=0 ;t<20; t++ ) begin
      x_i = $random%2;
      @(posedge clk) ;
      
    end
    #1 $stop() ;
    #1 $finish() ;
  end 
endmodule
    
  