`timescale 1ns / 1ps

module comp_4(
    input [3:0] A,
    input [3:0] B,
    input in_A_G_B,
    input in_A_E_B,
    input in_A_L_B,
    output out_A_G_B,
    output out_A_E_B,
    output out_A_L_B
    );
    
    reg A_G_B, A_E_B, A_L_B;
    
    always @(*) begin
    if (in_A_G_B == 1 && in_A_E_B == 0 && in_A_L_B == 0) begin
        A_G_B = 1;
        A_E_B = 0;
        A_L_B = 0;
        end
    else if (in_A_G_B == 0 && in_A_E_B == 1 && in_A_L_B == 0) begin
        A_G_B = 0;
        A_E_B = 0;
        A_L_B = 0;
        if (A>B)
            A_G_B = 1;
        else if (A == B)
            A_E_B = 1;
        else
            A_L_B = 1;
        end
    else begin
        A_G_B = 0;
        A_E_B = 0;
        A_L_B = 1;
        end
    end
    
    assign out_A_G_B = A_G_B;
    assign out_A_E_B = A_E_B;
    assign out_A_L_B = A_L_B;
        
endmodule    
