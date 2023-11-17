`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2023 19:43:18
// Design Name: 
// Module Name: nucleo
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


module nucleo(
    output wire b_TREADY,i_TREADY,k_TREADY,o_TVALID,
    input b_TVALID, i_TVALID, T_VALID,o_TREADY,clk,reset,
    input [7:0]i_TDATA,
    input [7:0]k_TDATA,
    input [7:0]b_TDATA,
    output[7:0]o_TDATA

    );
    wire r_enable,b_enable,a_enable;
    
    control control(
   b_TREADY,i_TREADY,k_TREADY,o_TVALID, r_enable,b_enable,a_enable,
     b_TVALID, i_TVALID, T_VALID,o_TREADY
    );
    
    acumulador acumulador(
    clk,
    reset,
    a_enable,r_enable,b_enable,
    i_TDATA,
    k_TDATA,
    b_TDATA,
    o_TDATA
);
    
endmodule
