`timescale 1ns / 1ps

module decoder_3_to_8(
    input [2:0] a,
    input [2:0] cs,
    output [7:0] y
    );
    
    reg [7:0] out;
    
    always @(*) begin
        case(a)
            3'b000: out = 8'b1;
            3'b001: out = 8'b10;
            3'b010: out = 8'b100;
            3'b011: out = 8'b1000;
            3'b100: out = 8'b10000;
            3'b101: out = 8'b100000;
            3'b110: out = 8'b1000000;
            3'b111: out = 8'b10000000;
        endcase
        
        if (cs != 3'b110) begin
            out= 8'b0;
        end
    end
    
    assign y = out;
endmodule    
