`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2023 00:19:55
// Design Name: 
// Module Name: calculateWeight2_tb
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
/*
module t_calculatePointer #(
  parameter WEIGHT_ADDRESS_SIZE = 8
  );

  reg clock;
  reg reset;
  reg getWeight;
  reg [WEIGHT_ADDRESS_SIZE-1:0] firstWeightPointer;
  wire [WEIGHT_ADDRESS_SIZE-1:0] pointer;
  wire getWeightFinished;
  wire enableRead;
  

  calculatePointer dut (
    .clock(clock),
    .reset(reset),
    .getWeight(getWeight),
    .firstWeightPointer(firstWeightPointer),
    .pointer(pointer),
    .getWeightFinished(getWeightFinished),
    .enableRead(enableRead)
  );
  
  always #5 clock = ~clock; // Genera un pulso de reloj cada 10 unidades de tiempo

  initial begin
    // initial state. base pointer assigned to internal pointer.
    clock = 1;
    reset = 0;
    getWeight= 0;
    firstWeightPointer = 6'b00000111;
    #10 
    $display("pointer: %b", pointer);

    // enable not work if is pressed when reset is disable. This is because when you disable
    // reset, you are passing from S0 to S1 and getWeight takes efect when in S1 (check diagrams.net diagram)
    reset = 1;
    getWeight= 1;
    #10  
    getWeight= 0;
    #30
    
    // start process
    getWeight= 1;
    #10 
    getWeight= 0;
    #100 
    
    // check again
    getWeight= 1;
    #10 
    getWeight= 0;
    #100 

    // check again
    getWeight= 1;
    #10 
    reset= 0;
    #100 

    
    $finish;
  end
  
  
endmodule

*/

module t_pointerController #(parameter ADDRESS_BUS_SIZE = 8 );
    wire [ADDRESS_BUS_SIZE-1:0]t_pointer; //out
    wire t_enableRead,t_xxxxControllerEnd;
    reg t_clock, t_reset, t_xxxxControllerStart; // in
    reg [ADDRESS_BUS_SIZE-1:0]t_basePointer;
    pointerController #(ADDRESS_BUS_SIZE) M1 (t_pointer,t_enableRead,t_xxxxControllerEnd,t_clock, t_reset, t_xxxxControllerStart, t_basePointer);
    initial #200 $finish;
    initial begin t_clock = 0; forever #5 t_clock = ~t_clock; end
    initial fork
    t_reset = 0;
    #2 t_reset = 1;
    #87 t_reset = 0;
    #89 t_reset = 1;
    #10 t_xxxxControllerStart = 1; t_basePointer = 10;
    #30 t_xxxxControllerStart = 0;
    #40 t_xxxxControllerStart = 1;
    #50 t_xxxxControllerStart = 0;
    #52 t_xxxxControllerStart = 1;
    #54 t_xxxxControllerStart = 0;
    #80 t_xxxxControllerStart = 1;
    #100 t_xxxxControllerStart = 0;
    #120 t_xxxxControllerStart = 1;
    join
endmodule
