module EDC(input logic clk,
           input logic a_i,
           input logic reset,
           output logic rising_edge_o,
           output logic falling_edge_o,
           output logic both_edge);
  
  logic copy = 0 ;
  logic signal_dly_pos;
  logic signal_dly_neg;
  assign rising_edge_o = a_i & ~signal_dly_pos ;
  assign falling_edge_o = ~a_i & signal_dly_neg ;
  assign both_edge = rising_edge_o | falling_edge_o ;
  
  always @(clk or posedge reset) begin
    if (reset) begin
      signal_dly_neg <= 1'b0 ;
      signal_dly_pos <= 1'b1 ;
    end
    else begin
      signal_dly_pos <= copy ;
      signal_dly_neg <= copy ;
      copy <= a_i ;
    end
  end
endmodule
    