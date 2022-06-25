`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2022 02:32:40
// Design Name: 
// Module Name: hardware_1
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


module hardware_1(
    input clk,reset,[31:0]d, 
    input [31:0]inp,
    output [31:0]salida
    );
    
    wire [7:0]out;
    wire [31:0]q1,q2,q3;
    
    memoria memoria(clk,reset,d,out,q1,q2,q3);
    deco deco(inp[2:0],out);
    red red(q1,q2,q3,salida);
    
endmodule


module deco(
    input [2:0]inp,
    output reg [7:0]out);

    always@* begin
        case(inp)
            3'b000: begin out=8'b00000000; end
            3'b001: begin out=8'b00000001; end
            3'b010: begin out=8'b00000010; end
            3'b011: begin out=8'b00000100; end
            3'b100: begin out=8'b00001000; end
            3'b101: begin out=8'b00010000; end
            3'b110: begin out=8'b00100000; end
            3'b111: begin out=8'b01000000; end
        endcase
    end
endmodule


module memoria(
    input clk,reset,
    input [31:0]d,
    input [7:0]en,
    output reg [31:0]q1,q2,q3 );

    assign reset = 0;
    always @ (posedge clk or posedge reset)
        if (reset)
            q1 <= 1'b0;
        else if (en[0])
            q1 <= d;
          
    always @ (posedge clk or posedge reset)
        if (reset)
            q2 <= 1'b0;
        else if (en[1])
            q2 <= d;

    always @ (posedge clk or posedge reset)
        if (reset)
            q3 <= 1'b0;
        else if (en[2])
            q3 <= d;    
endmodule


module red(
    input [31:0]q1,q2,q3,
    output [31:0]salida );
    
    assign salida = q1+q2+q3;
endmodule





