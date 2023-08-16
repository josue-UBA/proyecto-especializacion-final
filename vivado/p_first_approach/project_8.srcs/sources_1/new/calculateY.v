`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2023 01:01:38
// Design Name: 
// Module Name: calculateY
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


module calculateY(
    input clock, reset, setY,
    input [5:0]yIMinus1Sub1Pointer, // y i minus 1 sub 1 pointer
    input [3:0]m,
    output reg [5:0]pointer,
    output reg setYFinished,enableWrite
);

    reg [1: 0] state, next_state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4=3'b100;

    always @ (posedge clock, negedge reset) begin
        if (!reset) begin
            state <= S0;
            pointer <= yIMinus1Sub1Pointer + m;
        end
        else begin
            state <= next_state;
            if (state == S1) begin
                pointer <= pointer + 1;
            end
        end
    end
    
    always @ (state,setY)begin // Form the next state
        case (state)
            S0: if(setY) next_state = S1; else next_state = S0; 
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S4;
            S4: next_state = S0;
        endcase
    end
    
    always @(state,setYFinished) begin // Form the Mealy output
        case(state)
            S0: begin 
                setYFinished=0;
                enableWrite=0;
            end
            S3: enableWrite=1;
            S4: setYFinished=1;
        endcase
    end
    
endmodule
   
