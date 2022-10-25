module MUX_WTI(input  logic[3:0] a_i,
               input  logic[3:0] sel_i,
               output logic y_ter_o,
               output logic y_case_o,
               output logic y_ifelse_o,
               output logic y_loop_o,
               output logic y_aor_o) ;
  
  assign y_ter_o = sel_i[0]? a_i[0] : 
                   sel_i[1]? a_i[1] :
                   sel_i[2]? a_i[2] :
                   sel_i[3]? a_i[3] : 
                               1'bx ;
  
  always_comb begin
    case(sel_i)
      4'h1 : y_case_o = a_i[0]  ;
      4'h2 : y_case_o = a_i[1]  ;
      4'h4 : y_case_o = a_i[2]  ;
      4'h8 : y_case_o = a_i[3]  ;
      default : y_case_o = 1'bx ;
    endcase
  end
  
  always_comb begin
    if (sel_i[0]) y_ifelse_o = a_i[0] ;
    else if (sel_i[1]) y_ifelse_o = a_i[1] ;
    else if (sel_i[2]) y_ifelse_o = a_i[2] ;
    else if (sel_i[3]) y_ifelse_o = a_i[3] ;
    else               y_ifelse_o = 1'bx   ;
  end
  
  always_comb begin
    y_loop_o = 1'b0;
    for (int i=0; i<4; i++) begin
      y_loop_o = (sel_i[i] & a_i[i]) | y_loop_o;
    end
  end
  
  assign y_aor_o = (sel_i[0] & a_i[0]) |
                   (sel_i[1] & a_i[1]) |
                   (sel_i[2] & a_i[2]) |
                   (sel_i[3] & a_i[3]);
  
endmodule

  
  
      
  