// This file is public domain, it can be freely copied without restrictions.
// SPDX-License-Identifier: CC0-1.0

`timescale 1us/1us

module dff (
  input logic clk, 
  input logic reset,
  input logic r2_enable,r1_enable,m_enable,
  input logic [7:0]i_TDATA,
  input logic [7:0]k_TDATA,
  input logic [7:0]b_TDATA,
  
  output logic [7:0]o_TDATA
);

wire [7:0]b,mult;
reg [7:0]c,a;

always @(posedge clk or posedge reset)
  if(reset) a <= 0;
  else if(r1_enable) a <= mult;

always@(posedge clk or posedge reset)
  if(reset) o_TDATA <= 0;
  else if(r2_enable)o_TDATA <= b;

always @(m_enable or o_TDATA or b_TDATA) begin
    case (m_enable)
    1'b0: c <= o_TDATA;
    1'b1: c <= b_TDATA;
endcase
end

assign mult = i_TDATA * k_TDATA;
assign b = a + c;

endmodule
