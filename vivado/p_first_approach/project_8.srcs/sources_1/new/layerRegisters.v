`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2023 11:17:54
// Design Name: 
// Module Name: layerRegisters
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


module layerRegisters (Enable, ReadWrite, Address, DataIn, DataOut);
    input Enable, ReadWrite;
    input [3: 0] DataIn;
    input [5: 0] Address;
    output [3: 0] DataOut;
    reg [3: 0] DataOut;
    reg [3: 0] Mem [0: 63]; // 64 x 4 memory
    
    always @ (Enable or ReadWrite or DataIn)begin
        if (Enable) begin
            if (ReadWrite) DataOut = Mem [Address]; // Read
            else Mem [Address] = DataIn;  // Write
        end
        else DataOut = 4'bz;
    end // High impedance state
    
    
    initial begin
        // Initialize memory with specific values for the first three addresses
        Mem[0] = 4'b1010; // 10 in binary
        Mem[1] = 4'b0010; // 34 in binary
        Mem[2] = 4'b1011; // 11 in binary 
    end
    
endmodule
