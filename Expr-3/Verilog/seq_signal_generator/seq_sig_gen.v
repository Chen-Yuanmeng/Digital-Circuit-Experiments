`timescale 1ns / 1ps

module sequence_signal_generator(
    input clk,
    input rstn,
    output reg out
    );
        
    localparam [3:0] S0 = 4'b0000;
    localparam [3:0] S1 = 4'b0001;
    localparam [3:0] S2 = 4'b0010;
    localparam [3:0] S3 = 4'b0011;
    localparam [3:0] S4 = 4'b0100;
    localparam [3:0] S5 = 4'b0101;
    localparam [3:0] S6 = 4'b0110;
    localparam [3:0] S7 = 4'b0111;
    localparam [3:0] S8 = 4'b1000;
    localparam [3:0] S9 = 4'b1001;
    localparam [3:0] S10 = 4'b1010;
    localparam [3:0] S11 = 4'b1011;

    
    
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
    
    always @(state) begin
        case(state)
        S0: next_state = S1;
        S1: next_state = S2;
        S2: next_state = S3;
        S3: next_state = S4;
        S4: next_state = S5;
        S5: next_state = S6;
        S6: next_state = S7;
        S7: next_state = S8;
        S8: next_state = S9;
        S9: next_state = S10;
        S10: next_state = S11;
        S11: next_state = S0;
        default: next_state = S0;
        endcase
    end

    always @(state) begin
        case(state)
        S0: out = 1'b0;
        S1: out = 1'b0;
        S3: out = 1'b0;
        S5: out = 1'b0;
        S6: out = 1'b0;
        S9: out = 1'b0;
        S2: out = 1'b1;
        S4: out = 1'b1;
        S7: out = 1'b1;
        S8: out = 1'b1;
        S10: out = 1'b1;
        S11: out = 1'b1;
        default: out = 1'bx;
        endcase
    end
endmodule    
