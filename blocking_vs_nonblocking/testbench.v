module testbench;
  reg clk = 0;
  reg in;
  wire out;

  always #1 clk = !clk;

  delay d(in, clk, out);

  initial begin
    $monitor("%t clk %b in %b out %b", $time, clk, in, out);
    #1;
    in = 1;
    #1;
    #1;
    #1;
    #1;
    $finish();
  end

endmodule
