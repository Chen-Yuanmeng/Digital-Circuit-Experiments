`timescale 1ns / 1ps

module fsm_2(
    input clk,
    input rstn,
    input in,
    output reg out
    );
        
    localparam [2:0] S0 = 3'b0;
    localparam [2:0] S1 = 3'b1;
    localparam [2:0] S2 = 3'b10;
    localparam [2:0] S3 = 3'b11;
    localparam [2:0] S4 = 3'b100;
    
    
    reg [2:0] state = 3'b0;
    reg [2:0] next_state;
    
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
        S0: next_state = in ? S1 : S0;
        S1: next_state = in ? S0 : S2;
        S2: next_state = in ? S3 : S0;
        S3: next_state = in ? S4 : S2;
        S4: next_state = in ? S0 : S2;
        default: next_state = S0;
        endcase
    end

    always @(state) begin
        case(state)
        S0: out = 1'b0;
        S1: out = 1'b0;
        S2: out = 1'b0;
        S3: out = 1'b0;
        S4: out = 1'b1;
        default: out = 1'bx;
        endcase
    end
endmodule
