`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/05 17:39:31
// Design Name: 
// Module Name: cntr_top
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


module cntr_top(
    input clk, reset,
    output o_clk_1Hz
    );
    
wire o_clk_1MHz;
wire o_clk_1KHz;
wire o_clk_100Hz;
wire o_clk_1Hz;

cntr_1MHz   U0(.clk(clk), .reset(reset),              .o_clk(o_clk_1MHz));
cntr_1KHz   U1(.clk(o_clk_1MHz), .reset(reset),       .o_clk(o_clk_1KHz));
cntr_100Hz  U2(.clk(o_clk_1KHz), .reset(reset),       .o_clk(o_clk_100Hz));
cntr_1Hz    U3(.clk(o_clk_100Hz), .reset(reset),      .o_clk(o_clk_1Hz));

endmodule
