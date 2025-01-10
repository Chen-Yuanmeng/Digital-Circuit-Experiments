`timescale 1ns / 1ps


module test_newspaper_seller();
    reg clk;
    reg rstn;
    reg [1:0] in;
    wire out;

    newspaper_seller inst_newspaper_seller(
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
    end

    always begin
        #1 clk = ~clk;
    end

    always begin
        #2 in = $random() % 3;
        #4 in = 2'b10;
    end
endmodule    
