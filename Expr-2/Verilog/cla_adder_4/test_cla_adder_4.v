`timescale 1ns / 1ps

module test_cla_adder_4();

    reg [3:0] A, B;
    reg Cin;
    wire Cout;
    wire [3:0] S;

    cla_adder_4 inst_cla_add_4 (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
    A = 1'b0;
    B = 1'b0;
    Cin = 1'b0;
    end

    always begin
    #2;
    A = $random() % 16;
    B = $random() % 16;
    Cin = $random() % 2;
    end

endmodule
