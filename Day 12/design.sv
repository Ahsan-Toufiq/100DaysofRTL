module SequenceDetector(input logic clk, reset, x_i,
                        output logic det_o) ;
  
  logic[11:0] pattern_ff  ;
  logic[11:0] nxt_pattern ;
  
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      pattern_ff <= 12'h0       ;
    end
    else begin
      pattern_ff <= nxt_pattern ;
      $display(pattern_ff) ;
    end
  end
  
  assign nxt_pattern = {pattern_ff[10:0],x_i} ;
  assign det_o       = (pattern_ff == 12'b111011011011) ;
endmodule
  