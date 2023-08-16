`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2023 01:24:15
// Design Name: 
// Module Name: calculateY_tb
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


module calculateY_tb;

  reg clock;
  reg reset;
  reg setY;
  reg [5:0] yIMinus1Sub1Pointer;
  reg [3:0]m;
  wire [5:0] pointer;
  wire setYFinished;

  
  calculateY dut (
    .clock(clock),
    .reset(reset),
    .setY(setY),
    .yIMinus1Sub1Pointer(yIMinus1Sub1Pointer),
    .m(m),
    .pointer(pointer),
    .setYFinished(setYFinished)
  );
  
  always #5 clock = ~clock; // Genera un pulso de reloj cada 10 unidades de tiempo

  initial begin
    clock = 1;
    reset = 0;
    setY= 0;
    yIMinus1Sub1Pointer = 6'b000111;
    m=4;
    #10 
    $display("pointer: %b", pointer);

    reset = 1;
    setY= 1;
    #10 

    setY= 0;
    #30
    
    setY= 1;
    #10 
 
    setY= 0;
    #30 

    $finish;
  end
  
  
endmodule
