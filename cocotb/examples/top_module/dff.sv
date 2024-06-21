module top_module (
  input logic clk_i,
  input logic srst_i,
  input logic enable_i,
  input logic new_i,
  input logic i_TVALID,
  input logic k_TVALID,
  input logic b_TVALID,
  input logic o_TREADY,
  input logic [7:0] i_TDATA,
  input logic [7:0] k_TDATA,
  input logic [7:0] b_TDATA,

  output logic i_TREADY,
  output logic k_TREADY,
  output logic b_TREADY,
  output logic o_TVALID,
  output logic [7:0] o_TDATA
);

  // Interconexiones entre los módulos
  logic r1_enable, r2_enable, m_enable;

  // Instanciación del módulo dff
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
    .r1_enable(r1_enable),
    .r2_enable(r2_enable),
    .m_enable(m_enable)
  );

  // Instanciación del módulo accumulator
  accumulator acc (
    .clk(clk), 
    .reset(reset),
    .r2_enable(r2_enable), 
    .r1_enable(r1_enable), 
    .m_enable(m_enable),
    .i_TDATA(i_TDATA),
    .k_TDATA(k_TDATA),
    .b_TDATA(b_TDATA),
    .o_TDATA(o_TDATA)
  );

endmodule

// Módulo accumulator
module accumulator (
  input logic clk, 
  input logic reset,
  input logic r2_enable, r1_enable, m_enable,
  input logic [7:0] i_TDATA,
  input logic [7:0] k_TDATA,
  input logic [7:0] b_TDATA,
  output logic [7:0] o_TDATA
);

  wire [7:0] b, mult;
  reg [7:0] c, a;

  always @(posedge clk or negedge reset)
    if (!reset) 
      a <= 0;
    else if (r1_enable) 
      a <= mult;

  always @(posedge clk or negedge reset)
    if (!reset) 
      o_TDATA <= 0;
    else if (r2_enable) 
      o_TDATA <= b;

  always @(m_enable or o_TDATA or b_TDATA) 
    case (m_enable)
      1'b0: c <= o_TDATA;
      1'b1: c <= b_TDATA;
    endcase

  assign mult = i_TDATA * k_TDATA;
  assign b = a + c;

endmodule

// Módulo dff
module control_unit (
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
  output logic r1_enable,
  output logic r2_enable,
  output logic m_enable
);

  typedef enum logic [3:0] {S0, S1, S2, S3, S4, S5} statetype;
  statetype state, nextstate;

  // Registro de estado
  always_ff @(posedge clk, posedge reset)
    if (reset) 
      state <= S0;
    else 
      state <= nextstate;

  // Lógica de próximo estado
  always_comb
    case (state)
      S0: 
        if (!new_i) 
          nextstate = S0;
        else if (new_i && i_TVALID && k_TVALID && b_TVALID) 
          nextstate = S2;
        else 
          nextstate = S1;
      S1: 
        if (!i_TVALID || !k_TVALID || !b_TVALID) 
          nextstate = S1;
        else 
          nextstate = S2;
      S2: 
        nextstate = S3;
      S3:
        if (i_TVALID && k_TVALID) 
          nextstate = S3;
        else if (!new_i) 
          nextstate = S5;
        else 
          nextstate = S4;
      S4: 
        if (!i_TVALID || !k_TVALID) 
          nextstate = S4;
        else 
          nextstate = S3;
      S5:
        if (!o_TREADY) 
          nextstate = S5;
        else 
          nextstate = S1;
    endcase

  // Lógica de salida
  assign i_TREADY = (state == S2 || state == S3 || state == S4 || state == S5) ? 1 : 0;
  assign k_TREADY = (state == S2 || state == S3 || state == S4 || state == S5) ? 1 : 0;
  assign b_TREADY = (state == S2) ? 1 : 0;
  assign o_TVALID = (state == S5) ? 1 : 0;
  assign r1_enable = (state == S0 || state == S1 || state == S2 || state == S3) ? 1 : 0;
  assign r2_enable = (state == S0 || state == S1 || state == S2 || state == S3 || state == S5) ? 1 : 0;
  assign m_enable = (state == S0 || state == S1) ? 1 : 0;

endmodule
