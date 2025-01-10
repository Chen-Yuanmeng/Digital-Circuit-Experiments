`timescale 1ns / 1ps

module test_fsm();

    reg clk;
    reg rstn;
    reg in;
    wire out;

    fsm_1 inst_fsm_1(
        .clk(clk),
        .rstn(rstn),
        .in(in),
        .out(out)
    );

    initial begin
        clk = 0;
        rstn = 1;
        #0.1 rstn = 0;
        #1.1 rstn = 1;
    end

    initial begin
        in = 0;
        #4 in = 1;
        #4 in = 0;
    end

    always begin
        #1 clk = ~clk;
    end

    always begin
        #2 in = $random() % 2;
    end
endmodule

