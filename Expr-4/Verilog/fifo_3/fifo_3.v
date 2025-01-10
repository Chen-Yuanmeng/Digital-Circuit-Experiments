`timescale 1ps/1ps

module fifo_3 (
    input clk_read,
    input clk_write,
    input rstn,
    input [15:0] data_in,
    input input_valid,
    input output_enable,
    output reg [7:0] data_out,
    output reg input_enable,
    output reg output_valid
);
    reg [15:0] buffer [31:0];
    // Depth=32; use buffer[i] to refer to depth i

    reg [4:0] line_write = 5'b0;
    reg [4:0] line_read = 5'b0;

    reg readplace = 1'b0;

    always @(*) begin
        // If there is enough to read, then read it
        if ((line_write > line_read) || (line_write == line_read && !readplace)) begin
            output_valid = 1;
        end
        else begin
            output_valid = 0;
        end

        // If buffer is not full, then writing is allowed
        if (line_write == 5'b11111) begin
            input_enable = 0;
        end
        else begin
            input_enable = 1;
        end
    end

    always @(posedge clk_write or negedge rstn) begin
        if (rstn == 0) begin // 复位
            line_write <= 5'b0;
        end
        else if (input_enable && input_valid) begin
            buffer[line_write][15:0] <= data_in[15:0];
            line_write <= line_write + 1;
        end
    end

    always @(posedge clk_read or negedge rstn) begin
        if (rstn == 0) begin // 复位
            line_read <= 5'b0;
            readplace <= 1'b0;
        end
        else if (output_enable && output_valid) begin
            if (readplace) begin
                if (line_write == line_read && input_valid) begin
                    data_out[7:0] <= data_in[15:8];
                end
                else
                begin
                    data_out[7:0] <= buffer[line_read][15:8];
                end
                readplace <= 1'b0;
                line_read <= line_read + 1;
            end
            else begin
                if (line_write == line_read && input_valid) begin
                    data_out[7:0] <= data_in[7:0];
                end
                else 
                begin
                    data_out[7:0] <= buffer[line_read][7:0];
                end
                readplace <= 1'b1;
            end
        end
    end
endmodule    
