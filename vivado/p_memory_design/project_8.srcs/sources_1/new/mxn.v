`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2023 09:20:03
// Design Name: 
// Module Name: mxn
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:  Section 5.6  Synthesizable HDL Models of Sequential Circuits 303
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
module mxnController #(
    parameter m = 3,
    parameter n = 4
    ) ( 
    input mxnControllerStart, clock, reset,
    output reg endLayer, endNeuron, mxnControllerEnd 
    );
    
    reg [2: 0] state, next_state;
    reg [4:0] yCount, previousYCount; // depends on the size of m and d. Modify this.
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;
    
    always @ (posedge clock, negedge reset) begin
        if (!reset) begin
            state <= S0;
            previousYCount <= 0;
            yCount <= 0;
        end
        else begin  
            state <= next_state;
            if(state == S3) previousYCount <= previousYCount + 1; 
            if(state == S4) previousYCount <= 0;
            if(state == S5) yCount <= yCount +1;
        end
    end
    
        
    always @ (state, mxnControllerStart) // Form the next state
        case (state)
            S0: next_state = S1;
            S1: if (mxnControllerStart) next_state = S2; else next_state = S1;
            S2: next_state = S3;
            S3: if (previousYCount === m) next_state = S4; else next_state = S1;
            S4: next_state = S5;
            S5: if( yCount === n) next_state = S6; else next_state = S7;
            S6: next_state = S7;
            S7: next_state = S1;
        endcase
    
    
    always @ (state,mxnControllerStart) // Form the Mealy output
        case (state)
            S0: begin
                endNeuron = 0;
                endLayer = 0;
                mxnControllerEnd = 0;
            end           
            S2: begin
                endNeuron = 0;
                endLayer = 0;
                mxnControllerEnd = 0;
            end           
            S4: endNeuron = 1;
            S6: endLayer = 1;
            S7: mxnControllerEnd = 1;
        endcase
    
endmodule
