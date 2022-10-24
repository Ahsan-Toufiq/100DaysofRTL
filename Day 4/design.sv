module ALU(input logic[7:0] a_i ,
           input logic[7:0] b_i ,
           input logic[2:0] op_i ,
           output logic[7:0] alu_o);
  
  logic c_out ; // carry out 
  
  always_comb begin
    case(op_i)
      3'b000 : {c_out , alu_o} = {1'b0,a_i} + {1'b0,b_i} ;  // ADD
      3'b001 : alu_o = a_i - b_i ;                          // SUB
      3'b010 : alu_o = a_i[7:0] << b_i[2:0] ;               // SLL
      3'b011 : alu_o = a_i[7:0] >> b_i[2:0] ;               // SRL
      3'b100 : alu_o = a_i & b_i ;                          // AND
      3'b101 : alu_o = a_i | b_i ;                          // OR
      3'b110 : alu_o = a_i ^ b_i ;                          // XOR
      3'b111 : alu_o = {7'h0 , a_i == b_i} ;                // AND
    endcase
  end
endmodule
      