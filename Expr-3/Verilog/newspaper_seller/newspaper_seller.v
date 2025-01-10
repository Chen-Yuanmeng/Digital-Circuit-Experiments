`timescale 1ns / 1ps

module newspaper_seller(
    input clk,
    input rstn,
    input [1:0] in,
    output reg out
    );

    // in = 1 表示投入1分硬币
    // in = 2 表示投入2分硬币
    // in = 3 表示投入5分硬币
        
    localparam [2:0] S0 = 3'b000;
    localparam [2:0] S1 = 3'b001;
    localparam [2:0] S2 = 3'b010;
    localparam [2:0] S3 = 3'b011;
    localparam [2:0] S4 = 3'b100;
    localparam [2:0] S5 = 3'b101;

    reg [3:0] state = S0;
    reg [3:0] next_state;
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state <= S0;
        end
        else begin
            state <= next_state;
        end
    end
    
    always @(in or state) begin
        case(state)
        S0: begin
            if (in == 2'b01)
                next_state = S1;
            else if (in == 2'b10)
                next_state = S2;
            else if (in == 2'b11)
                next_state = S5;
            else
                next_state = S0;
        end
        S1: begin
            if (in == 2'b01)
                next_state = S2;
            else if (in == 2'b10)
                next_state = S3;
            else if (in == 2'b11)
                next_state = S5;
            else
                next_state = S1;
        end
        S2: begin
            if (in == 2'b01)
                next_state = S3;
            else if (in == 2'b10)
                next_state = S4;
            else if (in == 2'b11)
                next_state = S5;
            else
                next_state = S2;
        end
        S3: begin
            if (in == 2'b01)
                next_state = S4;
            else if (in == 2'b10)
                next_state = S5;
            else if (in == 2'b11)
                next_state = S5;
            else
                next_state = S3;
        end
        S4: begin
            if (in == 2'b01)
                next_state = S5;
            else if (in == 2'b10)
                next_state = S5;
            else if (in == 2'b11)
                next_state = S5;
            else
                next_state = S4;
        end
        S5: begin
            if (in == 2'b01)
                next_state = S1;
            else if (in == 2'b10)
                next_state = S2;
            else if (in == 2'b11)
                next_state = S5;
            else
                next_state = S0;
        end

        default: next_state = S0;
        endcase
    end

    always @(state) begin
        case(state)
        S5: out = 1'b1;
        S0: out = 1'b0;
        S1: out = 1'b0;
        S2: out = 1'b0;
        S3: out = 1'b0;
        S4: out = 1'b0;
        default: out = 1'bx;
        endcase
    end
endmodule    
