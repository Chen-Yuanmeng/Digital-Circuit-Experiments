`timescale 1ns / 1ps

module test_add_4();
    reg [3:0] in_0;
    reg [3:0] in_1;
    reg carry_in;
    wire [3:0] sum;
    wire carry_out;
    
    add_4 instance_add_4 (
        .add_0(in_0),
        .add_1(in_1),
        .c_in(carry_in),
        .out(sum),
        .c_out(carry_out)
    );
    
    initial begin
        in_0 = 4'b0001;
        in_1 = 4'b0000;
        carry_in = 1'b0;
    end
    
    always begin
        #2;
        in_0 = $random() % 16;
        in_1 = $random() % 16;
        carry_in = $random() % 2;
    end
endmodule
