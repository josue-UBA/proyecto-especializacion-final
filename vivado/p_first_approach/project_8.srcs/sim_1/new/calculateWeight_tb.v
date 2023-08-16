`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2023 21:28:46
// Design Name: 
// Module Name: calculateWeight_tb
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


module calculateWeight_tb;

  reg clock;
  reg reset;
  reg getWeight;
  wire [5:0] pointer;
  wire getWeightFinished;

  
  calculateWeight dut (
    .clock(clock),
    .reset(reset),
    .getWeight(getWeight),
    .pointer(pointer),
    .getWeightFinished(getWeightFinished)
  );
  
  always #10 clock = ~clock; // Genera un pulso de reloj cada 10 unidades de tiempo

  initial begin
    clock = 0;
    reset = 0;
    getWeight = 0;
    #10 
    $display("pointer: %b", pointer);

    reset = 1;
    #10     

    getWeight = 1;
    #10
    
    getWeight = 0;
    #10
    
    $finish;
  end
  
  
endmodule
