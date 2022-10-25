module SequenceDetector_tb() ;
  logic clk; 
  logic reset; 
  logic x_i; 
  logic det_o ;
  
  SequenceDetector Day12(.*) ;
  
  always #1 clk = ~clk;

  
  initial begin 
    $dumfile("day12.vcd") ;
    $dumpvars(1) ;
  end
  
  logic [11:0] seq = 12'b1110_1101_1011;

  initial begin
    clk = 0 ;
    reset <= 1'b1;
    x_i <= 1'b1;
    @(posedge clk);
    reset <= 1'b0;
    @(posedge clk);
    for (int i=0; i<12; i=i+1) begin
      x_i <= seq[i];
      @(posedge clk);
    end
    for (int i=0; i<12; i=i+1) begin
      x_i <= $random%2;
      @(posedge clk);
    end
    $stop() ;
    $finish();
  end
endmodule
    