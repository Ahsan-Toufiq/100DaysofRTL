module odd_counter(input logic clk , 
                   input logic reset ,
                   output logic[7:0] cnt_o) ;
  logic[7:0] nxt_count ;
  assign nxt_count = cnt_o + 8'h2 ;
  
  always @(clk or posedge reset) begin
    if (reset) begin
      cnt_o <= 8'h1 ;
    //  nxt_count <= 8'h3 ;
    end
    
    else begin
      cnt_o <= nxt_count ;
      //nxt_count = cnt_o + 8'h2 ;
    end
  end
  
endmodule
      
      
    
    