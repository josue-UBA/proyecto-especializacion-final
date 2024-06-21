module dff(
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
  output logic r_enable,
  output logic a_enable,
  output logic b_enable);

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