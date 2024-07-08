`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2023 12:34:52
// Design Name: 
// Module Name: bloque1
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


module acumulador(
    input wire clk,
    input wire reset,
    input wire a_enable,r_enable,b_enable,
    input wire [7:0] i_TDATA,
    input wire [7:0] k_TDATA,
    input wire [7:0] b_TDATA,
    output reg [7:0] o_TDATA
);

    reg [7:0]c,a;
    wire [7:0]b,salida;
    
    always@(posedge clk or negedge reset)
        if(!reset) a <= 0;
        else if(r_enable) a <= salida;
            
    always@(posedge clk or negedge reset)
        if(!reset) o_TDATA <= 0;
        else if(a_enable)o_TDATA <= b;
    
    assign salida = i_TDATA*k_TDATA;
    assign b = a + c;

    always @(b_enable or o_TDATA or b_TDATA) begin
        case (b_enable)
        1'b0: c <= o_TDATA;
        1'b1: c <= b_TDATA;
    endcase
    end
    


endmodule

