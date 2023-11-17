`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2023 17:10:01
// Design Name: 
// Module Name: layerRegisterBank
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Section 4.12 HDL Models of Combinational Circuits 209
//              Section 5.6  Synthesizable HDL Models of Sequential Circuits 297
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module layerRegisetBank(
    input [0:15]D_D,output [0:15]D_Q_1,
    output [0:15]D_Q_2,
    output [0:15]D_Q_3,
    
    input d_A,d_B,
    input d_enable
);

    wire [0:3]d_D;

    D_latch D_latch_1(D_Q_1,d_D[0],D_D);
    D_latch D_latch_2(D_Q_2,d_D[1],D_D);
    D_latch D_latch_3(D_Q_3,d_D[2],D_D);
    decoder decoder(d_D, d_A, d_B, d_enable);
endmodule


module D_latch (output reg [0:15]Q, input enable, [0:15]D);
    always @ (enable, D)
        if (enable) Q <= D; // No action if enable not asserted
endmodule


module decoder (D, A, B, enable);
output [0: 3] D;
input A, B;
input enable;
    wire A_not, B_not, enable_not;
    not
    G1 (A_not, A), // Comma-separated list of primitives
    G2 (B_not, B),
    G3 (enable_not, enable);
    nand
    G4 (D[0], A_not, B_not, enable_not),
    G5 (D[1], A_not, B, enable_not),
    G6 (D[2], A, B_not, enable_not),
    G7 (D[3], A, B, enable_not);
endmodule
