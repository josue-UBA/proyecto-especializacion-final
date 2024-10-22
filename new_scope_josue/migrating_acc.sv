// This file is public domain, it can be freely copied without restrictions.
// SPDX-License-Identifier: CC0-1.0

`timescale 1us/1us

module accumulator(
  input  logic        clk,          // Reloj
  input  logic        reset,        // Reset
  input  logic        enable,       // Habilitar operación
  input  logic [15:0] i_TDATA,            // Primer operando (16 bits)
  input  logic [15:0] k_TDATA,            // Segundo operando (16 bits)
  output logic [31:0] o_TDATA        // Resultado acumulado (32 bits)
);

  logic [31:0] mult;         // Resultado de la multiplicación

  // Usar el bloque DSP para la multiplicación
  (* use_dsp = "yes" *) 
  assign mult = i_TDATA * k_TDATA;       // Multiplicación de 16 bits x 16 bits -> 32 bits

  // Proceso secuencial para el acumulador
  always_ff @(posedge clk or posedge reset) begin
    if (reset)
      o_TDATA <= 32'b0;              // Resetear el acumulador a 0
    else if (enable)
      o_TDATA <= o_TDATA + mult;  // Acumular el resultado de la multiplicación
  end

endmodule
