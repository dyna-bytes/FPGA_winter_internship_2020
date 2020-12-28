`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 17:09:41
// Design Name: 
// Module Name: flipflop
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


module flipflop(
    input clk, d,
    //output q,qbar
    output n,nbar,q,qbar
    );
    //wire n,nbar;
    dlatch u_dlatch1(~clk,d,n,nbar);
    dlatch u_dlatch2(clk,n,q,qbar);
endmodule
