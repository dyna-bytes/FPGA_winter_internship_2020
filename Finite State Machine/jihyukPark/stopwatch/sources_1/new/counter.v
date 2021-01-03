`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/31 13:20:34
// Design Name: 
// Module Name: counter
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


module counter(clk, reset, count);
parameter N = 10;
input clk;
input reset;
output reg [N-1 : 0] count;

parameter adjustment_factor_for_tb = 64;
parameter trg = 10'b11_1111_1111/adjustment_factor_for_tb; //trigger

always @(posedge clk or posedge reset)
    if (reset || (count >= trg)) count <= 1'b0;
    else count <= count + 1'b1;

endmodule
