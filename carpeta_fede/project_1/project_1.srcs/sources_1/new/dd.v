       `timescale 1ns / 1ps

// Mealy FSM zero detector (see Fig. 5.15 and Fig. 5.16) Verilog 2001, 2005 syntax
// Asynchronous reset
module Mealy_Zero_Detector (
    input [7:0]k_TDATA,
    input k_TVALID,
    output reg k_TREADY,

    input [7:0]i_TDATA,
    input i_TVALID,
    output reg i_TREADY,

    input [7:0]b_TDATA,
    input b_TVALID,
    output reg b_TREADY,

    output reg [7:0]o_TDATA,
    output reg o_TVALID,
    input o_TREADY,

    input new_i, clock, reset

);
    
    reg [7:0]accumulator;
    
    reg [2: 0] state, next_state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;

    always @ (posedge clock, negedge reset) //Verilog 2001, 2005 syntax
        if (!reset) state <= S0;
        else state <= next_state;
     
    always @ (state, i_TVALID, k_TVALID, b_TVALID, o_TREADY,new_i) // Form the next state
        case (state)
        S0: 
            if(new_i) next_state = S1; 
            else next_state = S0;
        S1: 
            if (i_TVALID && k_TVALID && b_TVALID) next_state = S2; 
            else next_state = S1;
        S2: next_state = S3;
        S3: 
            if(new_i)begin
                if (i_TVALID && k_TVALID) next_state = S3; 
                else if (!i_TVALID || !k_TVALID) next_state = S4; 
            end
            else 
                next_state = S5;
        S4: 
            if (i_TVALID && k_TVALID) next_state = S3; 
            else next_state = S4;
        S5: 
            if (!o_TREADY) next_state = S5; 
            else next_state = S0;
        endcase
       
    always @ (posedge clock, negedge reset) //Verilog 2001, 2005 syntax
        if (!reset)accumulator <= 0;
        else begin
            if(next_state == S0) accumulator <= 0; 
            else if(next_state == S2) accumulator <= (i_TDATA * k_TDATA) + b_TDATA;
            else if(next_state == S3) accumulator <= (i_TDATA * k_TDATA) + accumulator; 
            else if(next_state == S5) o_TDATA <= accumulator;
       end
   
    always @ (state) // Form the Mealy output
        case (state)
        S0: begin 
   //         accumulator = 0;
            i_TREADY = 0; 
            k_TREADY = 0;
            b_TREADY = 0;
            o_TVALID = 0;end
        S2: begin 
     //       accumulator = (i_TDATA * k_TDATA) + b_TDATA;
            i_TREADY = 1; 
            k_TREADY = 1;
            b_TREADY = 1;
            end
        S3: begin 
       //     accumulator = (i_TDATA * k_TDATA) + accumulator; 
            i_TREADY = 1; 
            k_TREADY = 1;
            b_TREADY = 0;end
        S5: begin
         //   o_TDATA = accumulator;
            o_TVALID = 1;end
        endcase
    
    endmodule
