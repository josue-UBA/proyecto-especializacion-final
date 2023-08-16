`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 13:28:30
// Design Name: 
// Module Name: mainController
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


// Mealy FSM zero detector (see Fig. 5.15 and Fig. 5.16) Verilog 2001, 2005 syntax
// Asynchronous reset
module layerController (
    output reg 
        lxEnd,
        mxnControllerStart,
        weightPointerControllerStart,
        previousYPointerControllerStart,
        yPointerControllerStart,
        enableMemory,
    input 
        lxStart, 
        mxnControllerEnd, 
        weightPointerControllerEnd, 
        previousYPointerControllerEnd,
        yPointerControllerEnd,
        endNeuron,
        endLayer, 
        clock, 
        reset
    );
    
    reg [3: 0] state, next_state;
    parameter  
        S0  = 4'b0000,
        S1  = 4'b0001,
        S2  = 4'b0010,
        S3  = 4'b0011,
        S4  = 4'b0100,
        S5  = 4'b0101,
        S6  = 4'b0110,
        S7  = 4'b0111,
        S8  = 4'b1000,
        S9  = 4'b1001,
        S10 = 4'b1010,
        S11 = 4'b1011,
        S12 = 4'b1100,
        S13 = 4'b1101,
        S14 = 4'b1110;
    
    always @ (posedge clock, negedge reset) 
        if (!reset) state <= S0;
        else state <= next_state;
    
    always @ (state, lxStart, mxnControllerEnd , weightPointerControllerEnd, previousYPointerControllerEnd,yPointerControllerEnd,endNeuron,endLayer) // Form the next state
        case (state)
            S0: next_state = S1;
            S1: if(lxStart)next_state = S2; else next_state = S1;
            S2: next_state = S3;
            S3: next_state = S4;
            S4: next_state = S5;
            S5: if (!mxnControllerEnd) next_state = S5; 
                else if (mxnControllerEnd && !endNeuron) next_state = S6;
                else if (mxnControllerEnd && endNeuron) next_state = S10;
                else if (mxnControllerEnd && endLayer) next_state = S14;
            S6: next_state = S7;
            S7: next_state = S8;   
            S8: if(!weightPointerControllerEnd || !previousYPointerControllerEnd) next_state = S8;
                else if (weightPointerControllerEnd && previousYPointerControllerEnd) next_state = S9;
            S9: next_state = S3;
            S10: next_state = S11;
            S11: next_state = S12;
            S12: if(yPointerControllerEnd) next_state = S13; else next_state = S12;
            S13: next_state = S3;
            S14: next_state = S1;
        endcase
        
    always @ (state, lxStart, mxnControllerEnd , weightPointerControllerEnd, previousYPointerControllerEnd,yPointerControllerEnd,endNeuron,endLayer) // Form the Mealy output
        case (state)
            S0: begin 
                lxEnd = 0;
                weightPointerControllerStart = 0;
                previousYPointerControllerStart = 0;
                yPointerControllerStart = 0;
                mxnControllerStart = 0;
                enableMemory = 0;
            end
            S2: begin 
                lxEnd = 0;
                weightPointerControllerStart = 0;
                previousYPointerControllerStart = 0;
                yPointerControllerStart = 0;
                mxnControllerStart = 0;
            end
            S3: begin
                enableMemory = 0;
                mxnControllerStart = 1;
            end
            S4: mxnControllerStart = 0;
            S6: begin
                weightPointerControllerStart = 1;
                previousYPointerControllerStart = 1;            
            end
            S7: begin
                weightPointerControllerStart = 0;
                previousYPointerControllerStart = 0;            
            end
            S9: enableMemory = 1;
            S10: yPointerControllerStart = 1;
            S11: yPointerControllerStart = 0;
            S14: lxEnd = 1;
        endcase
        
endmodule
