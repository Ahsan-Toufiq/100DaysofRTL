module reloadingCounter(input logic clk, reset, load_i ,
                        input logic[3:0] load_val_i    ,
                        output logic[3:0] count_o    ) ;
  
  logic[3:0] load_ff ; 
  
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      load_ff <= 4'b0000 ;
    end
    else if (load_i) begin
      load_ff <= load_val_i ;
    end
  end
  
  logic[3:0] count_ff  ;
  logic[3:0] nxt_count ;
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      count_ff <= 4'b0000 ;
    end
    else begin
      count_ff <= nxt_count ;
    end
  end
  
  assign nxt_count = load_i ? load_val_i : (count_ff==4'b1111) ? load_ff : (count_ff + 4'b0001) ;

  assign count_o = count_ff ;
  
endmodule
    
      
  
  
      