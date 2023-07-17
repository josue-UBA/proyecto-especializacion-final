`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2023 21:21:05
// Design Name: 
// Module Name: memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Section 7.2??Random-Access Memory
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module memory #(
    parameter WORD_BUS_SIZE = 16, // bits
    parameter MEM_SIZE = 256, // space
    parameter MEM_BUS_SIZE = $clog2(MEM_SIZE) 
)(
    input enableRead, enableWrite,
    input [WORD_BUS_SIZE-1: 0] dataIn,
    input [MEM_BUS_SIZE-1 : 0] addressRead,
    input [MEM_BUS_SIZE-1 : 0] addressWrite,
    output [WORD_BUS_SIZE-1: 0] dataOut
);
    reg [WORD_BUS_SIZE-1: 0] dataOut;
    reg [WORD_BUS_SIZE-1: 0] Mem [0: MEM_SIZE-1]; // 64 x 4 memory
    always @ (enableRead or enableWrite or dataIn) begin
        if (enableRead) begin
            dataOut = Mem [addressRead]; // Read
        end
        else begin
            dataOut = {WORD_BUS_SIZE{1'bz}}; // High impedance state
        end
        if (enableWrite) begin
            Mem [addressWrite] = dataIn;
        end
    end
endmodule
