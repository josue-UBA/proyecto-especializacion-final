`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2023 11:37:37
// Design Name: 
// Module Name: datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Section 8.10 Design with Multiplexers 535
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module datapath#(
    parameter MEM_BUS_SIZE = 8,
    parameter WORD_BUS_SIZE = 16
    )(
    input reset,clock,getWeight,enableWrite,
    input [WORD_BUS_SIZE-1:0]dataIn,
    input [MEM_BUS_SIZE-1:0]addressWrite,
    output [WORD_BUS_SIZE-1:0]dataOut
    );
    
    wire wIMinusSub1Pointer;
    wire enableRead;
    wire pointer;
    assign wIMinusSub1Pointer = 8'b00000011;
    calculateWeight calculateWeight(clock, reset, getWeight,wIMinusSub1Pointer,pointer,getWeightFinished,enableRead);
    memory memory(enableRead, enableWrite,dataIn,pointer,addressWrite,dataOut);
    
endmodule
