module shift_register(input logic clk ,
                      input logic reset ,
                      input logic x_i ,
                      output logic[3:0] sr_o) ;
  logic[3:0] nxt_reg ;
  logic[3:0] sr_reg ;
  
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      sr_reg <= 4'b0 ;
    end
    else begin
      sr_reg <= nxt_reg ;
    end
  end
  
  assign nxt_reg = {sr_reg[2:0] , x_i } ;
  assign sr_o = nxt_reg ;
  
endmodule
  