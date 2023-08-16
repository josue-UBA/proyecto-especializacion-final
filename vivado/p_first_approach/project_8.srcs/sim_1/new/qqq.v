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
// Description: Section 7.2  Random-Access Memory 399
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module t_memory #(
    parameter DATA_BUS = 16, // bits
    parameter ADDRESS_BUS = 8,
    parameter ADDRESS_DEPH = 2 ** ADDRESS_BUS
);

    wire [DATA_BUS -1: 0] t_dataOut;
    reg t_enableRead, t_enableWrite;
    reg [DATA_BUS -1: 0] t_dataIn;
    reg [ADDRESS_BUS-1 : 0] t_addressRead;
    reg [ADDRESS_BUS-1 : 0] t_addressWrite;

    memory #(DATA_BUS,ADDRESS_BUS,ADDRESS_DEPH) M0 (
        t_dataOut,
        t_enableRead, 
        t_enableWrite,
        t_dataIn,
        t_addressRead,
        t_addressWrite);
        
    initial #200 $finish;
    initial fork
    
    // init
    #0 t_enableRead = 0; t_enableWrite = 0; t_dataIn = 0; t_addressRead = 0; t_addressWrite = 0;
    
    // write data 1
    #10 t_dataIn = 123;
    #20 t_enableWrite = 1;

    // write data 2
    #30 t_enableWrite = 0;
    #40 t_dataIn = 456; 
    #50 t_addressWrite = 1;
    #60 t_enableWrite = 1;
    
    // read data 2
    #70 t_addressRead = 1;
    #80 t_enableRead = 1;
    
    
    join
endmodule

/*

module globalRegisters_tb;
  reg EnableRead;
  reg EnableWrite;
  reg [3:0] DataIn;
  reg [5:0] AddressRead;
  reg [5:0] AddressWrite;
  wire [3:0] DataOut;

  globalRegisters dut (
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
*/