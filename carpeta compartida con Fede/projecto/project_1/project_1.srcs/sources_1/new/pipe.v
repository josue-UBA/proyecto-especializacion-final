`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2023 11:41:17
// Design Name: 
// Module Name: pipe
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


module ProcesadorPipeline(
    input clk,
    input reset,
    output reg [7:0] instruction
);

reg [7:0] instruction_fetch, instruction_decode, instruction_execute;

always @(posedge clk) begin
    if (reset) begin
        instruction_fetch <= 8'b0;
        instruction_decode <= 8'b0;
        instruction_execute <= 8'b0;
    end else begin
        instruction_fetch <= instruction_fetch + 1;
        instruction_execute <= instruction_decode;
        instruction_decode <= instruction_fetch;
    end
end


endmodule

