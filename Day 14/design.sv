module FPA(req_i,
           gnt_o);
  parameter NUM_PORTS = 4 ;
  
  input  logic[NUM_PORTS-1:0] req_i ;
  output logic[NUM_PORTS-1:0] gnt_o ;
  
  assign gnt_o[0] = req_i[0]        ;
  
  genvar x ;
  for (x=1 ; x<NUM_PORTS ; x++) begin
    assign gnt_o[x] = req_i[x] & ~(|gnt_o[x-1:0]) ;
  end
endmodule
    
    