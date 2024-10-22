`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2024 09:14:29
// Design Name: 
// Module Name: asd
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


module asd(
  input wire clk,          // Reloj
  input wire reset,        // Reset
  input wire enable,       // Habilitar operación
  input wire [15:0] A,     // Primer operando (16 bits)
  input wire [15:0] B,     // Segundo operando (16 bits)
  output reg [31:0] result // Resultado acumulado (32 bits)
);

  wire [31:0] mult_result;  // Resultado de la multiplicación

  // Usar el bloque DSP para la multiplicación
  (* use_dsp = "yes" *) 
  assign mult_result = A * B;  // Multiplicación de 16 bits x 16 bits -> 32 bits

  // Proceso secuencial para el acumulador
  always @(posedge clk or posedge reset) begin
    if (reset)
      result <= 32'b0;          // Resetear el acumulador a 0
    else if (enable)
      result <= result + mult_result;  // Acumular el resultado de la multiplicación
  end

endmodule

