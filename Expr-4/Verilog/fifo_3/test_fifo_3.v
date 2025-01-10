`timescale 1ps/1ps

module test_fifo();
    reg clk_read, clk_write, rstn;
    reg [15:0] data_in;
    wire [7:0] data_out;
    reg input_valid, output_enable;
    wire input_enable, output_valid;

    fifo_3 inst_fifo_3(
        .clk_read(clk_read),
        .clk_write(clk_write),
        .rstn(rstn),
        .data_in(data_in),
        .input_valid(input_valid),
        .output_enable(output_enable),
        .data_out(data_out),
        .input_enable(input_enable),
        .output_valid(output_valid)
    );


    always #3 begin
        clk_write = ~clk_write;
    end

    always #2 begin
        clk_read = ~clk_read;
    end

    initial begin
        clk_read = 1'b0;
        clk_write = 1'b0;
        rstn = 1'b1;
        #1 rstn = 1'b0;
        #2 rstn = 1'b1;
    end

    always begin
        #3;
        data_in = $random() % 17'b1_0000_0000_0000_0000;
    end

    always begin
        #6;
        input_valid = $random() % 2;
        output_enable = $random() % 2;
    end
endmodule