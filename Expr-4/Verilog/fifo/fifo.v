`timescale 1ps/1ps

module fifo (
    input clk,
    input rstn,
    input [7:0] data_in,
    input input_valid,
    input output_enable,
    output reg [15:0] data_out,
    output reg input_enable,
    output reg output_valid
);
    reg [15:0] buffer [31:0];
    // Depth=32; use buffer[i] to refer to depth i

    reg [4:0] line_write = 5'b0;
    reg [4:0] line_read = 5'b0;

    reg writeplace = 1'b0;

    always @(*) begin
        if (line_write == 5'b11111 && writeplace == 1'b1) begin
            input_enable = 0;
            output_valid = 1;
        end
        else begin
            input_enable = 1;
            output_valid = 0;
        end
    end

    always @(posedge clk or negedge rstn) begin
        if (rstn == 0) begin // 复位
            line_write <= 5'b0;
            line_read <= 5'b0;
        end
        else begin
            if (input_enable && input_valid) begin
                if (writeplace) begin
                    buffer[line_write][15:8] <= data_in[7:0];
                    line_write <= line_write + 1;
                    writeplace <= 1'b0;
                end
                else begin
                    buffer[line_write][7:0] <= data_in[7:0];
                    writeplace <= 1'b1;
                end
            end
            else if (output_enable && output_valid) begin
                data_out[15:0] <= buffer[line_read][15:0];
                line_read <= line_read + 1;
            end
        end
    end
endmodule
