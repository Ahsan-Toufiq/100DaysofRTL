// D Flip-Flop

module DFlipFlop(input logic d_i,
                 input logic clk,
                 input logic reset,
                 output logic q_norst_o,
                 output logic q_syncrst_o,
                 output logic q_asyncrst_o);
  
  
      // Synchronous reset
  always @(posedge clk) begin
    if (~reset) begin
      q_syncrst_o <= d_i ;
    end
	else begin
      q_syncrst_o <= 0;
    end
  end
  
     // Asynchronous reset
  always @(posedge reset, posedge clk) begin
    if (~reset) begin
      q_asyncrst_o <= d_i ;
    end
    else begin
      q_asyncrst_o <= 0;
    end
  end
  
     // No reset
  always @(posedge clk) begin
    q_norst_o <= d_i;
  end
       
endmodule

      
    
    
    
  