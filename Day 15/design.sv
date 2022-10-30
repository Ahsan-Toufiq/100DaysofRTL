module RRA(input  logic        clk   ,
           input  logic        reset ,
           input  logic[3:0]   req_i ,
           output logic[3:0]   gnt_o );

  logic [3:0] mask_q;
  logic [3:0] nxt_mask;

  always_ff @(posedge clk or posedge reset)
    if (reset) begin
      mask_q <= 4'hF;
    end
    else begin
      mask_q <= nxt_mask;
    end

  always_comb begin
    nxt_mask = mask_q;
         if (gnt_o[0]) nxt_mask = 4'b1110;
    else if (gnt_o[1]) nxt_mask = 4'b1100;
    else if (gnt_o[2]) nxt_mask = 4'b1000;
    else if (gnt_o[3]) nxt_mask = 4'b0000;
  end

  logic [3:0] mask_req;

  assign mask_req = req_i & mask_q;

  logic [3:0] mask_gnt;
  logic [3:0] raw_gnt;

  FPA #(4) maskedGnt (.req_i(mask_req), .gnt_o (mask_gnt));
  
  FPA #(4) rawGnt (.req_i(req_i), .gnt_o (raw_gnt));
  
  assign gnt_o = |mask_req ? mask_gnt : raw_gnt;

endmodule

module FPA #(
  parameter NUM_PORTS = 4
)(
  input  logic[NUM_PORTS-1:0] req_i ,
  output logic[NUM_PORTS-1:0] gnt_o
);
  
  assign gnt_o[0] = req_i[0]        ;
  
  genvar x ;
  for (x=1 ; x<NUM_PORTS ; x++) begin
    assign gnt_o[x] = req_i[x] & ~(|gnt_o[x-1:0]) ;
  end
endmodule
    
    