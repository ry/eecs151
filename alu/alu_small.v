module alu(a, b, f, r);
  input [31:0] a, b;
  input [2:0] f;
  output [31:0] r;
  always @ (a or b or f)
    case (f)
      3'b000: r = a + b;
      3'b001: r = a + 1'b1;
      3'b010: r = a - b;
      3'b011: r = a - 1'b1;
      3'b100: r = a * b;
      default: r = 32'bx;
    endcase
endmodule
