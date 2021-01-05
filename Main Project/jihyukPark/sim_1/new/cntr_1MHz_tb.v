`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/05 16:01:42
// Design Name: 
// Module Name: cntr_1MHz_tb
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


module cntr_1MHz_tb();
reg clk, reset;
wire o_clk_1MHz;
wire o_clk_1KHz;
wire o_clk_100Hz;
wire o_clk_1Hz;

cntr_1MHz   U0(.clk(clk), .reset(reset),              .o_clk(o_clk_1MHz));
cntr_1KHz   U1(.clk(o_clk_1MHz), .reset(reset),       .o_clk(o_clk_1KHz));
cntr_100Hz  U2(.clk(o_clk_1KHz), .reset(reset),       .o_clk(o_clk_100Hz));
cntr_1Hz    U3(.clk(o_clk_100Hz), .reset(reset),      .o_clk(o_clk_1Hz));

parameter clk_period = 10;
always begin
    clk = 1;
    forever #(clk_period/2) clk = ~clk;
end

initial begin
    reset = 1;
    #13 reset = 0;
    #(clk_period) reset = 1;
end
endmodule
