`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2023 04:10:43
// Design Name: 
// Module Name: ff
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


module t_Mealy_Zero_Detector;

reg [7:0]t_k_TDATA;
reg t_k_TVALID;
wire t_k_TREADY;

reg [7:0]t_i_TDATA;
reg t_i_TVALID;
wire  t_i_TREADY;

reg [7:0]t_b_TDATA;
reg t_b_TVALID;
wire t_b_TREADY;

wire [7:0]t_o_TDATA;
wire t_o_TVALID;
reg t_o_TREADY;

reg t_new_i, t_clock, t_reset;



Mealy_Zero_Detector M0 (
    t_k_TDATA,
    t_k_TVALID,
    t_k_TREADY,
    
    t_i_TDATA,
    t_i_TVALID,
    t_i_TREADY,
    
    t_b_TDATA,
    t_b_TVALID,
    t_b_TREADY,
    
    t_o_TDATA,
    t_o_TVALID,
    t_o_TREADY,
    
    t_new_i, t_clock, t_reset

);
initial #400 $finish;
initial begin t_clock = 0; forever #5 t_clock = ~t_clock; end
initial fork
// initial state
t_reset = 0;
t_new_i = 0;
t_k_TVALID = 0;
t_i_TVALID = 0;
t_b_TVALID = 0;
t_k_TDATA = 0; 
t_i_TDATA = 0; 
t_b_TDATA = 0;
t_o_TREADY = 0;
// set the reset
#2 t_reset = 1;
#87 t_reset = 0;
#89 t_reset = 1;



//provider set the first data
#124 t_i_TDATA = 5;
#124 t_k_TDATA = 0;
#124 t_b_TDATA = 0;
//start convolution
#134 t_new_i = 1;
//provider validates its data
#144 t_i_TVALID = 1;
#144 t_k_TVALID = 1;
#144 t_b_TVALID = 1;
//the streaming has started...
#154 t_i_TDATA = 2;
#154 t_k_TDATA = 1;
#164 t_i_TDATA = 3;
#164 t_k_TDATA = 0;
#174 t_i_TDATA = 3;
#174 t_k_TDATA = -1;
#184 t_i_TDATA = 0;
#184 t_k_TDATA = 1;
#194 t_i_TDATA = 2;
#194 t_k_TDATA = -1;
#204 t_i_TDATA = 3;
#204 t_k_TDATA = 0;
#214 t_i_TDATA = 2;
#214 t_k_TDATA = 1;
#224 t_i_TDATA = 1;
#224 t_k_TDATA = 0;
//stop convolution
#234 t_new_i = 0;
//provider will get ready for the next convolution
#284 t_i_TVALID = 0;
#284 t_k_TVALID = 0;
#284 t_b_TVALID = 0;
//consumer validates data
#294 t_o_TREADY = 1;
#344 t_o_TREADY = 0;
//provider set the first data
#394 t_i_TDATA = 2;
#394 t_k_TDATA = 0;
#394 t_b_TDATA = 0;
//start convolution
#404 t_new_i = 1;
//provider validates its data
#414 t_i_TVALID = 1;
#414 t_k_TVALID = 1;
#414 t_b_TVALID = 1;
//the streaming has started...
#424 t_i_TDATA = 3;
#424 t_k_TDATA = 1;
#434 t_i_TDATA = 3;
#434 t_k_TDATA = 0;
#444 t_i_TDATA = 0;
#444 t_k_TDATA = -1;
#454 t_i_TDATA = 2;
#454 t_k_TDATA = 1;
#464 t_i_TDATA = 1;
#464 t_k_TDATA = -1;
#474 t_i_TDATA = 2;
#474 t_k_TDATA = 0;
#484 t_i_TDATA = 1;
#484 t_k_TDATA = 1;
#494 t_i_TDATA = 0;
#494 t_k_TDATA = 0;
//stop convolution
#504 t_new_i = 0;
//provider will get ready for the next convolution
#554 t_i_TVALID = 0;
#554 t_k_TVALID = 0;
#554 t_b_TVALID = 0;
//consumer validates data
#564 t_o_TREADY = 1;
#614 t_o_TREADY = 0;


/*
// set initial data
#114 t_b_TDATA = 0;
#114 t_i_TDATA = 5;
#114 t_k_TDATA = 0;
// external control ask the core to start convolution
#114 t_new_i = 1;
// input data is validated
#124 t_i_TVALID = 1;
#124 t_k_TVALID = 1;
#124 t_b_TVALID = 1;
// stream
#134 t_i_TDATA = 2;
#134 t_k_TDATA = 1;
#144 t_i_TDATA = 3;
#144 t_k_TDATA = 0;
#154 t_i_TDATA = 3;
#154 t_k_TDATA = -1;
#164 t_i_TDATA = 0;
#164 t_k_TDATA = 1;
#174 t_i_TDATA = 2;
#174 t_k_TDATA = -1;
#184 t_i_TDATA = 3;
#184 t_k_TDATA = 0;
#194 t_i_TDATA = 2;
#194 t_k_TDATA = 1;
#204 t_i_TDATA = 1;
#204 t_k_TDATA = 0;
#214 t_new_i = 0;
*/
join
endmodule