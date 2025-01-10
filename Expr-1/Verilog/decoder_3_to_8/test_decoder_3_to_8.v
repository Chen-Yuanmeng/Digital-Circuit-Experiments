`timescale 1ns / 1ps

module test_de3to8();
    reg [2:0] a, cs;
    wire [7:0] y;

    decoder_3_to_8 inst_de3t8(
        .a(a),
        .cs(cs),
        .y(y)
    );
    
    initial begin
        a = 3'b0;
        cs = 3'b0;
    end
    
    always begin
        #2;
        a = $random() % 8;
        cs = $random() % 8;
    end
endmodule
