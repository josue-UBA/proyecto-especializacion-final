`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2023 19:19:11
// Design Name: 
// Module Name: weightPointer
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


// Mealy FSM zero detector (see Fig. 5.15 and Fig. 5.16) Verilog 2001, 2005 syntax
// Asynchronous reset
module calculateWeight (
    input clock, reset, getWeight,
    output reg getWeightFinished,
    output reg [5:0]pointer
);

    reg [1: 0] state, next_state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    always @ (posedge clock, negedge reset) begin
        if (!reset) begin
            state <= S0;
            pointer <= 6'b100;
        end
        else begin
            state <= next_state;
            if (state == S1) begin
                pointer <= pointer + 1;
            end
        end
    end
    
    always @ (state,getWeight)begin // Form the next state
        case (state)
            S0: if(getWeight) next_state = S1; else next_state = S0; 
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S0;
        endcase
    end
    
    always @(state,getWeightFinished) begin // Form the Mealy output
        case(state)
            S0: getWeightFinished=0;
            S3: getWeightFinished=1;
        endcase
    end
    
endmodule
   
