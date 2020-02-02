module mux32two(i0,i1,sel,out);
  input [31:0] i0,i1;
  input sel;
  output [31:0] out;
  assign out = sel ? i1 : i0;
endmodule

module add32(i0,i1,sum);
  input [31:0] i0,i1;
  output [31:0] sum;
  assign sum = i0 + i1;
endmodule

module sub32(i0,i1,diff);
  input [31:0] i0,i1;
  output [31:0] diff;
  assign diff = i0 - i1;
endmodule

module mul16(i0,i1,prod);
  input [15:0] i0,i1;
  output [31:0] prod;
  // this is a magnitude multiplier
  // signed arithmetic later
  assign prod = i0 * i1;
endmodule

module mux32three(i0,i1,i2,sel,out);
  input [31:0] i0,i1,i2;
  input [1:0] sel;
  output [31:0] out;
  reg [31:0] out;
  always @ (i0 or i1 or i2 or sel)
  begin
    case (sel)
      2'b00: out = i0;
      2'b01: out = i1;
      2'b10: out = i2;
      default: out = 32'bx;
    endcase
  end
endmodule

module alu(a, b, f, r);
  input [31:0] a, b;
  input [2:0] f;
  output [31:0] r;
  wire [31:0] addmux_out, submux_out;
  wire [31:0] add_out, sub_out, mul_out;
  mux32two adder_mux(.i0(b), .i1(32'd1), .sel(f[0]), .out(addmux_out));
  mux32two sub_mux(.i0(b), .i1(32'd1), .sel(f[0]), .out(submux_out));
  add32 our_adder(.i0(a), .i1(addmux_out), .sum(add_out));
  sub32 our_subtracter(.i0(a), .i1(submux_out), .diff(sub_out));
  mul16 our_multiplier(.i0(a[15:0]), .i1(b[15:0]), .prod(mul_out));
  mux32three output_mux(.i0(add_out), .i1(sub_out), .i2(mul_out), .sel(f[2:1]), .out(r));
endmodule
