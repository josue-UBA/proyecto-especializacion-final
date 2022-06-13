`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2022 02:32:40
// Design Name: 
// Module Name: hardware_1
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


module hardware_1#(
    parameter integer C_S_AXI_DATA_WIDTH	= 32
    )(
    input wire [C_S_AXI_DATA_WIDTH-1:0]entrada,
    output wire [C_S_AXI_DATA_WIDTH-1:0]salida
    );
    
    assign salida = entrada + 1;
endmodule
