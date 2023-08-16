`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2023 00:12:21
// Design Name: 
// Module Name: calculateWeight
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Section 5.6  Synthesizable HDL Models of Sequential Circuits 303
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pointerController#(parameter ADDRESS_BUS_SIZE = 8) (
    output reg [ADDRESS_BUS_SIZE-1:0]pointer,
    output reg enableRead,xxxxControllerEnd,
    input clock, reset, xxxxControllerStart,
    input [ADDRESS_BUS_SIZE-1:0]basePointer // w i minus 1 sub 1 pointer
);

    reg [2: 0] state, next_state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110;

    always @ (posedge clock, negedge reset) begin
        if (!reset) begin
            state <= S0;
            pointer <= basePointer;
        end
        else begin
            state <= next_state;
            if (state == S5) begin
                pointer <= pointer + 1;
            end
        end
    end
    
    always @ (state,xxxxControllerStart) // Form the next state
        case (state)
            S0: next_state = S1;
            S1: if(xxxxControllerStart) next_state = S2; else next_state = S1; 
            S2: next_state = S3;
            S3: next_state = S4;
            S4: next_state = S5;
            S5: next_state = S6;
            S6: next_state = S1;
        endcase
    
    
    always @(state,xxxxControllerStart)  // Form the Mealy output
        case(state)
            S0: begin
                xxxxControllerEnd = 0;
                enableRead=0;
            end
            S2: xxxxControllerEnd = 0;
            S3: enableRead = 1;
            S4: enableRead = 0;
            S6: xxxxControllerEnd = 1;            
        endcase 
    
endmodule
   
