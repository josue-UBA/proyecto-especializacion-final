`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2023 09:57:03
// Design Name: 
// Module Name: mxn_tb
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


module t_mxnController;
    
    wire t_endLayer, t_endNeuron, t_mxnControllerEnd; // out
    reg t_start, t_clock, t_reset; // in

    mxnController M0 (t_start, t_clock, t_reset, t_endLayer, t_endNeuron, t_mxnControllerEnd);
    initial #200 $finish;
    initial begin t_clock = 0; forever #5 t_clock = ~t_clock; end
    initial fork
    t_reset = 0;
    #2 t_reset = 1;
    #87 t_reset = 0;
    #89 t_reset = 1;
    #10 t_start = 1;
    #30 t_start = 0;
    #40 t_start = 1;
    #50 t_start = 0;
    #52 t_start = 1;
    #54 t_start = 0;
    #80 t_start = 1;
    #100 t_start = 0;
    #120 t_start = 1;
    join
    endmodule
