`timescale 1ns / 1ps


module test_sequence_signal_generator();

    reg clk;
    reg rstn;
    wire out;

    sequence_signal_generator inst_sequence_signal_generator(
        .clk(clk),
        .rstn(rstn),
        .out(out)
    );

    initial begin
        clk = 0;
        rstn = 1;
        #0.1 rstn = 0;
        #1.1 rstn = 1;
    end

    always begin
        #1 clk = ~clk;
    end
endmodule    
