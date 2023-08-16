`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2023 23:17:39
// Design Name: 
// Module Name: borrame
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module decoder_2x4_df_beh ( // Verilog 2001, 2005 syntax
    output reg [0: 3] D,
    input A, B,
    enable
    );
    always @ (A, B, enable) begin
        D[0] <= !((!A) && (!B) && (!enable));
        D[1] <= !((!A) && B && (!enable));
        D[2] <= !(A && (!B) && (!enable));
        D[3] <= !(A && B && (!enable));
    end
endmodule
