`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2023 23:15:58
// Design Name: 
// Module Name: qqq
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: source Section 7.2??Random-Access Memory
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module memory_tb;
  reg EnableRead;
  reg EnableWrite;
  reg [3:0] DataIn;
  reg [5:0] AddressRead;
  reg [5:0] AddressWrite;
  wire [3:0] DataOut;

  memory dut (
    .EnableRead(EnableRead),
    .EnableWrite(EnableWrite),
    .DataIn(DataIn),
    .AddressRead(AddressRead),
    .AddressWrite(AddressWrite),
    .DataOut(DataOut)
  );

  initial begin
    $display("Testbench para el módulo memory");

    // escritura
    EnableWrite=0;
    AddressWrite=6'b000000;
    DataIn = 4'b0111;
    #10;
    EnableWrite=1;
    #10;
    EnableWrite=0;
    AddressWrite=6'b000001;
    DataIn = 4'b0010;
    #10;
    EnableWrite=1;
    #10;
    EnableWrite=0;
    AddressWrite=6'b000010;
    DataIn = 4'b1100;
    #10;
    EnableWrite=1;
    #10;
    
    // lectura 1
    EnableRead = 0;
    AddressRead = 6'b000000;
    #10;
    EnableRead = 1;
    #10;
    $display("Mem[Address]: %b", DataOut);

    // lectura 2
    #10;
    EnableRead = 0;
    AddressRead = 6'b000001;
    #10;
    EnableRead = 1;
    #10;
    $display("Mem[Address]: %b", DataOut);

    // lectura 3
    #10;
    EnableRead = 0;
    AddressRead = 6'b000010;
    #10;
    EnableRead = 1;
    #10;
    $display("Mem[Address]: %b", DataOut);
        
    
    // Prueba 3: Memoria deshabilitada
    EnableRead = 0;
    #10;        
    $display("Mem[Address]: %b", DataOut);
    
    // Finalizar la simulación
    $finish;
  end
endmodule
