`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2022 15:35:58
// Design Name: 
// Module Name: regfile
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

module regfile(
    input logic clk,reset,inp,
    input logic d, 
    output reg q1,q2,q3 );
    
    
    wire en1,en2,en3;
    
    memoria(clk,reset,d,en1,en2,en3,q1,q2,q3 );
    deco(inp,en1,en2,en3);
    
    // three ported register file
    // read two ports combinationally
    // write third port on rising edge of clock
    // register 15 reads PC + 8 instead    


endmodule


module memoria(
    input logic clk,reset,
    input logic d,
    input reg en1,en2,en3,
    output reg q1,q2,q3 );

    always @ (posedge clk or posedge reset)
        if (reset)
            q1 <= 1'b0;
        else if (en1)
            q1 <= d;
          
    always @ (posedge clk or posedge reset)
        if (reset)
            q2 <= 1'b0;
        else if (en2)
            q2 <= d;

    always @ (posedge clk or posedge reset)
        if (reset)
            q3 <= 1'b0;
        else if (en2)
            q3 <= d;    
endmodule

module deco(
    input logic inp,
    output reg en1,en2,en3);


    always_comb begin
        if(inp == 1)begin
            en1 = 1'b1;
            en2 = 1'b0;
            en3 = 1'b0;
        end
        else if(inp == 2)begin
            en1 = 1'b0;
            en2 = 1'b1;
            en3 = 1'b0;
        end
        else if(inp == 3)begin
            en1 = 1'b0;
            en2 = 1'b0;
            en3 = 1'b1;
        end
    end
endmodule
