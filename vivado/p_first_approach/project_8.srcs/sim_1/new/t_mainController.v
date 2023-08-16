`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 17:18:51
// Design Name: 
// Module Name: t_mainController
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

module t_layerController;    
    wire // output
        t_lxEnd,
        t_mxnControllerStart,
        t_weightPointerControllerStart,
        t_previousYPointerControllerStart,
        t_yPointerControllerStart,
        t_enableMemory;
    
    reg // input
        t_lxStart, 
        t_mxnControllerEnd, 
        t_weightPointerControllerEnd, 
        t_previousYPointerControllerEnd,
        t_yPointerControllerEnd,
        t_endNeuron,
        t_endLayer, 
        t_clock, 
        t_reset;
    
    layerController M0 (        
        t_lxEnd,
        t_mxnControllerStart,
        t_weightPointerControllerStart,
        t_previousYPointerControllerStart,
        t_yPointerControllerStart,
        t_enableMemory,
        t_lxStart, 
        t_mxnControllerEnd, 
        t_weightPointerControllerEnd, 
        t_previousYPointerControllerEnd,
        t_yPointerControllerEnd,
        t_endNeuron,
        t_endLayer, 
        t_clock, 
        t_reset
    );
    initial #200 $finish;
    initial begin t_clock = 0; forever #5 t_clock = ~t_clock; end
    initial fork
    t_reset = 0;
    #2 t_reset = 1; t_lxStart = 0;t_previousYPointerControllerEnd = 0;t_weightPointerControllerEnd = 0;
    #30 t_lxStart =1 ; 
    #88 t_mxnControllerEnd = 1; t_endNeuron = 0;
    #120 t_previousYPointerControllerEnd = 1;
    #125 t_weightPointerControllerEnd = 1;
    #145 t_mxnControllerEnd = 0; t_endNeuron = 0; t_endLayer = 0;
    #182 t_mxnControllerEnd = 1; t_endNeuron = 1;
    /*
    #87 t_reset = 0;
    #89 t_reset = 1;
    #10 t_xStart = 1;
    #30 t_xStart = 0; t_weightPointerControllerEnd = 0;
    #40 t_xStart = 1;
    #50 t_xStart = 0;
    #52 t_xStart = 1;
    #54 t_xStart = 0;
    #80 t_xStart = 1;
    #100 t_mxnControllerEnd = 1;
    */
    
    
/*
     ___     ___
    |   |   |   |
 ---     ---     ---
0   5  10  15  20   25
    
    
   5(2x+1) <> 5(2x+1)+5   up
   10x     <> 10x+5  down 

*/
    join
endmodule

