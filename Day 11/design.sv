module ParallelToSerialShifter(input logic clk,reset,
                               input logic[3:0] parallel_i,
                               output logic serial_o, valid_o, empty_o) ;
  
  logic[3:0] shift_ff  ;
  logic[3:0] nxt_shift ;
  
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      shift_ff <= 3'h0 ;
    end
    else begin
      shift_ff <= nxt_shift ;
    end
  end
  
  assign nxt_shift = empty_o ? parallel_i : {1'b0, shift_ff[3:1]} ;
  assign serial_o  = shift_ff[0] ;
  
  logic[3:0] count_ff ;
  logic[3:0] nxt_count ;
  
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      count_ff <= 4'h0 ;
    end
    else begin
      count_ff <= nxt_count ;
    end
  end
  
  assign nxt_count = (count_ff == 4'h4) ? 4'h0 : (count_ff + 1'h1) ;
  
  assign empty_o = (count_ff == 4'h0) ;
  assign valid_o = |count_ff ;

endmodule
      
                               