`timescale 1ps/1ps

module test_fifo();
    reg clk, rstn;
    reg [7:0] data_in;
    wire [15:0] data_out;
    reg input_valid, output_enable;
    wire input_enable, output_valid;

    fifo inst_fifo(
        .clk(clk),
        .rstn(rstn),
        .data_in(data_in),
        .input_valid(input_valid),
        .output_enable(output_enable),
        .data_out(data_out),
        .input_enable(input_enable),
        .output_valid(output_valid)
    );


    always #2 begin
        clk = ~clk;
    end

    initial begin
        clk = 1'b0;
        rstn = 1'b1;
        #1 rstn = 1'b0;
        #2 rstn = 1'b1;
    end

    always begin
        #3;
        data_in = $random() % 9'b1_0000_0000;
    end

    always begin
        #6;
        input_valid = $random() % 2;
        output_enable = $random() % 2;
    end
endmodule
