`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 18:26:30
// Design Name: 
// Module Name: sregister
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


module sregister(
    input [3:0] sin,
    input clk, reset,
    output [3:0] sout,q1,q2,q3
    );
    
    ff u_ff3(.clk(clk),.reset(reset),.d(sin),.q(q3));
    ff u_ff2(.clk(clk),.reset(reset),.d(q3),.q(q2));
    ff u_ff1(.clk(clk),.reset(reset),.d(q2),.q(q1));
    ff u_ff0(.clk(clk),.reset(reset),.d(q1),.q(sout));
    
endmodule
