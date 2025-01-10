`timescale 1ns / 1ps

module comp_16(
    input [15:0] A,
    input [15:0] B,
    output out_A_G_B,
    output out_A_E_B,
    output out_A_L_B
    );

    wire mid_A_G_B_1, mid_A_E_B_1, mid_A_L_B_1;
    wire mid_A_G_B_2, mid_A_E_B_2, mid_A_L_B_2;
    wire mid_A_G_B_3, mid_A_E_B_3, mid_A_L_B_3;

    comp_4 comp_4_1 (
        .A(A[15:12]),
        .B(B[15:12]),
        .in_A_G_B(1'b0),
        .in_A_E_B(1'b1),
        .in_A_L_B(1'b0),
        .out_A_G_B(mid_A_G_B_1),
        .out_A_E_B(mid_A_E_B_1),
        .out_A_L_B(mid_A_L_B_1)
    );

    comp_4 comp_4_2 (
        .A(A[11:8]),
        .B(B[11:8]),
        .in_A_G_B(mid_A_G_B_1),
        .in_A_E_B(mid_A_E_B_1),
        .in_A_L_B(mid_A_L_B_1),
        .out_A_G_B(mid_A_G_B_2),
        .out_A_E_B(mid_A_E_B_2),
        .out_A_L_B(mid_A_L_B_2)
    );

    comp_4 comp_4_3 (
        .A(A[7:4]),
        .B(B[7:4]),
        .in_A_G_B(mid_A_G_B_2),
        .in_A_E_B(mid_A_E_B_2),
        .in_A_L_B(mid_A_L_B_2),
        .out_A_G_B(mid_A_G_B_3),
        .out_A_E_B(mid_A_E_B_3),
        .out_A_L_B(mid_A_L_B_3)
    );

    comp_4 comp_4_4 (
        .A(A[3:0]),
        .B(B[3:0]),
        .in_A_G_B(mid_A_G_B_3),
        .in_A_E_B(mid_A_E_B_3),
        .in_A_L_B(mid_A_L_B_3),
        .out_A_G_B(out_A_G_B),
        .out_A_E_B(out_A_E_B),
        .out_A_L_B(out_A_L_B)
    );

endmodule
