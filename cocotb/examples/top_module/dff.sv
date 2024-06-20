

`timescale 1us/1us

module top_module (
  input logic clk,
  input logic reset,
  input logic enable_i,
  input logic new_i,
  input logic [7:0] i_TDATA,
  input logic [7:0] k_TDATA,
  input logic [7:0] b_TDATA,
  input logic i_TVALID,
  input logic k_TVALID,
  input logic b_TVALID,
  input logic o_TREADY,
  output logic [7:0] o_TDATA,
  output logic i_TREADY,
  output logic k_TREADY,
  output logic b_TREADY,
  output logic o_TVALID
);

  // Signals to connect control unit and accumulator
  logic a_enable, r_enable, b_enable;

  // Instantiate the control unit
  control_unit cu (
    .clk(clk),
    .reset(reset),
    .i_TVALID(i_TVALID),
    .k_TVALID(k_TVALID),
    .b_TVALID(b_TVALID),
    .o_TREADY(o_TREADY),
    .new_i(new_i),
    .i_TREADY(i_TREADY),
    .k_TREADY(k_TREADY),
    .b_TREADY(b_TREADY),
    .o_TVALID(o_TVALID),
    .a_enable(a_enable),
    .b_enable(b_enable),
    .r_enable(r_enable)
  );

  // Instantiate the accumulator
  accumulator acc (
    .clk(clk),
    .reset(reset),
    .a_enable(a_enable),
    .r_enable(r_enable),
    .b_enable(b_enable),
    .i_TDATA(i_TDATA),
    .k_TDATA(k_TDATA),
    .b_TDATA(b_TDATA),
    .o_TDATA(o_TDATA)
  );

endmodule



module control_unit(
  input logic clk,
  input logic reset,
  input logic i_TVALID,
  input logic k_TVALID,
  input logic b_TVALID,
  input logic o_TREADY,
  input logic new_i,

  output logic i_TREADY,
  output logic k_TREADY,
  output logic b_TREADY,
  output logic o_TVALID,
  output logic a_enable,
  output logic b_enable,
  output logic r_enable);

  typedef enum logic [3:0] {S0, S1, S2, S3, S4, S5} statetype;
  statetype state, nextstate;

  // state register
  always_ff @(posedge clk, posedge reset)
    if (reset) state <= S0;
    else state <= nextstate;

  // next state logic
  always_comb
    case (state)
      S0: 
        if(!new_i) nextstate = S0;
        else if(new_i && i_TVALID && k_TVALID && b_TVALID) nextstate = S2;
        else nextstate = S1;
      S1: 
        if(!i_TVALID || !k_TVALID || !b_TVALID) nextstate = S1;
        else nextstate = S2;
      S2: nextstate = S3;
      S3:
        if(i_TVALID && k_TVALID) nextstate = S3;
        else if(!new_i) nextstate = S5;
        else nextstate = S4;
      S4: 
        if(!i_TVALID || !k_TVALID) nextstate = S4;
        else nextstate = S3;
      S5:
        if(!o_TREADY) nextstate = S5;
        else nextstate = S1;
    endcase

  // output logic
  assign i_TREADY = (state == S2 || state == S3 || state == S4 || state == S5) ? 1 : 0;
  assign k_TREADY = (state == S2 || state == S3 || state == S4 || state == S5) ? 1 : 0;
  assign b_TREADY = (state == S2) ? 1 : 0;
  assign o_TVALID = (state == S5) ? 1 : 0;
  assign r_enable = (state == S0 || state == S1 || state == S2 || state == S3) ? 1 : 0;
  assign a_enable = (state == S0 || state == S1 || state == S2 || state == S3 || state == S5) ? 1 : 0;
  assign b_enable = (state == S0 || state == S1) ? 1 : 0;

endmodule



module accumulator (
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
