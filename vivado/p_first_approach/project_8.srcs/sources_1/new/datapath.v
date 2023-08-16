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
    parameter w_DATA_BUS = 16, // bits
    parameter w_ADDRESS_BUS = 8,

    parameter y_DATA_BUS = 16, // bits
    parameter y_ADDRESS_BUS = 5
)(
    output [w_DATA_BUS -1: 0] w_dataOut,
    input w_enableRead, w_enableWrite,
    input [w_DATA_BUS -1: 0] w_dataIn,
    input [w_ADDRESS_BUS-1 : 0] w_addressRead,
    input [w_ADDRESS_BUS-1 : 0] w_addressWrite,
    
    output [y_DATA_BUS -1: 0] y_dataOut,
    input y_enableRead, y_enableWrite,
    input [y_DATA_BUS -1: 0] y_dataIn,
    input [y_ADDRESS_BUS-1 : 0] y_addressRead,
    input [y_ADDRESS_BUS-1 : 0] y_addressWrite
);

    memory #(w_DATA_BUS,w_ADDRESS_BUS) weightGlobalRegisterBank(
        w_dataOut,
        w_enableRead, 
        w_enableWrite, 
        w_dataIn, 
        w_addressRead, 
        w_addressWrite);
        
    memory #(y_DATA_BUS,y_ADDRESS_BUS) yGlobalRegisterBank(
        y_dataOut,
        y_enableRead, 
        y_enableWrite, 
        y_dataIn, 
        y_addressRead, 
        y_addressWrite);

/*#(
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
    */
    
    
endmodule
