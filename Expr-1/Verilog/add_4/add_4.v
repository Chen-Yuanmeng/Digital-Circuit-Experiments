`timescale 1ns / 1ps

module add_4(
    input [3:0] add_0,
    input [3:0] add_1,
    input c_in,
    output [3:0] out,
    output c_out
    );
    assign {c_out, out} = add_0 + add_1 + c_in;
endmodule