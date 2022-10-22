module day1_tb ();

  logic [7:0] a;
  logic [7:0] b;
  logic select;
  logic [7:0] out;
  
  
  day1 ob1 (.*);
  initial begin
    $dumpfile("day1.vcd");
    $dumpvars(0, day1_tb);
  end


  initial begin
    for (int i = 0; i < 10; i++) begin
      a   = $urandom_range (0, 8'hFF);
      b   = $urandom_range (0, 8'hFF);
      select = $random%2;
      #5;
    end
  end
endmodule