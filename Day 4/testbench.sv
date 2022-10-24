module ALU_tb();
  logic[7:0] a_i ;
  logic[7:0] b_i ;
  logic[2:0] op_i ;
  logic[7:0] alu_o ;
  
  ALU day4 (.*);
  
  initial begin
    $dumfiles("day4.vcd") ;
    $dumpvars(1) ;
  end
  
  initial begin
    for (int x=0; x<3; x++) begin
      for (int y=0; y<8; y++) begin
        a_i = $urandom_range(8'h0,8'hFF);
        b_i = $urandom_range(8'h0,8'hFF) ;
        op_i = 3'(y) ; 
        #2 ;
      end
    end
  end
endmodule
    
  