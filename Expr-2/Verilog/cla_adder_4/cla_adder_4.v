`timescale 1ns / 1ps

module cla_adder_4(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout
    );

    wire [3:0] G;
    wire [3:0] P;
    wire [3:0] C;

    assign G = A & B;
    assign P = A ^ B;

    assign C[0] = G[0] | (P[0] & Cin);
    assign C[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
    assign C[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & P[0] & Cin);
    assign C[3] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & P[1] & P[0] & Cin);

    assign S = A ^ B ^ {C[2:0], Cin};

    assign Cout = C[3];
endmodule    