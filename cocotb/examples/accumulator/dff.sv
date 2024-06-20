// This file is public domain, it can be freely copied without restrictions.
// SPDX-License-Identifier: CC0-1.0

`timescale 1us/1us

module dff (
  input logic clk, 
  input logic reset,
  input logic a_enable,r_enable,b_enable,
  input logic [7:0]i_TDATA,
  input logic [7:0]k_TDATA,
  input logic [7:0]b_TDATA,
  output logic [7:0]o_TDATA
);

wire [7:0]b,salida;
reg [7:0]c,a;

always @(posedge clk or negedge reset)
  if(!reset) a <= 0;
  else if(r_enable) a <= salida;

always@(posedge clk or negedge reset)
  if(!reset) o_TDATA <= 0;
  else if(a_enable)o_TDATA <= b;

always @(b_enable or o_TDATA or b_TDATA) begin
    case (b_enable)
    1'b0: c <= o_TDATA;
    1'b1: c <= b_TDATA;
endcase
end

assign salida = i_TDATA*k_TDATA;
assign b = a + c;

endmodule