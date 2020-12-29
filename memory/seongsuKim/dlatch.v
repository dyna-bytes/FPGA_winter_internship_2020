`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 16:14:46
// Design Name: 
// Module Name: dlatch
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


module dlatch(
    input clk,d,
    output q,qbar,r,s
    );
    assign r = clk & ~d;
    assign s = clk & d;
    srlatch u_sr(.r(r),.s(s),.q(q),.qbar(qbar));
endmodule
