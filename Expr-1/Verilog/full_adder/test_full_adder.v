`timescale 1ns / 1ps

module test_full_adder();
    reg a, b, ci;
    wire s, co;
    
    full_adder inst_fa(
        .a(a),
        .b(b),
        .ci(ci),
        .s(s),
        .co(co)
    );
    
    initial begin
        a = 1'b0;
        b = 1'b0;
        ci = 1'b0;
    end
    
    always begin
        #2;
        a = $random() % 2;
        b = $random() % 2;
        ci = $random() % 2;
    end

endmodule
