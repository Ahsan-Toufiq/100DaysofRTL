module LFSR(input logic clk ,
            input logic reset ,
            output logic[3:0] lfsr_o) ;
  
  logic[3:0] lfsr_ff ;
  logic[3:0] nxt_lfsr ;
  
  assign nxt_lfsr = {lfsr_ff[2:0], lfsr_ff[1] ^ lfsr_ff[3]} ;
  assign lfsr_o = lfsr_ff ;

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      lfsr_ff <= 4'hf ;
    end
    else begin
      lfsr_ff <= nxt_lfsr ;
    end
  end
  
endmodule
  
  