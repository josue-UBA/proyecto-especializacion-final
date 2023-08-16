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
// Description: Section 7.2  Random-Access Memory 399
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module memory #(
    parameter DATA_BUS = 16, // bits
    parameter ADDRESS_BUS = 8,
    parameter ADDRESS_DEPH = 2 ** ADDRESS_BUS
)(
    output [DATA_BUS -1: 0] dataOut,
    input enableRead, enableWrite,
    input [DATA_BUS -1: 0] dataIn,
    input [ADDRESS_BUS-1 : 0] addressRead,
    input [ADDRESS_BUS-1 : 0] addressWrite
);
    reg [DATA_BUS -1: 0] dataOut;
    reg [DATA_BUS -1: 0] Mem [0: ADDRESS_DEPH-1]; // ADDRESS_DEPH x DATA_BUS memory
    
    always @ (enableRead or enableWrite or dataIn) begin
        if (enableRead) begin
            dataOut = Mem [addressRead]; // Read
        end
        else begin
            dataOut = {DATA_BUS {1'bz}}; // High impedance state
        end
        if (enableWrite) begin
            Mem [addressWrite] = dataIn;
        end
    end
endmodule
