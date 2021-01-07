`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/30 13:33:59
// Design Name: 
// Module Name: sdecoder
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


module sdecoder(
    input [3:0] D,
    output a,b,c,d,e,f,g,dp
//    output [7:0] seg
    );
    assign a = ~D[3]&~D[2]&~D[0] | D[3]&~D[0] | ~D[3]&D[1] | D[2]&D[1] | ~D[3]&D[2]&D[0] | D[3]&~D[2]&~D[1];
    assign b = ~D[3]&~D[2] | ~D[3]&~D[1]&~D[0] | ~D[3]&D[1]&D[0] | D[3]&~D[1]&D[0] | D[3]&~D[2]&~D[0];
    assign c = ~D[3]&~D[1] | ~D[3]&D[0] | ~D[3]&D[2] | ~D[1]&D[0] | D[3]&~D[2];
    assign d = D[3]&~D[1] | D[2]&~D[1]&D[0] | D[2]&D[1]&~D[0] | ~D[2]&D[1]&D[0] | ~D[3]&~D[2]&~D[0];
    assign e = ~D[2]&~D[0] | D[3]&D[2] | D[1]&~D[0] | D[3]&D[1]&D[0];
    assign f = ~D[1]&~D[0] | D[3]&~D[2] | D[2]&D[1]&~D[0] | ~D[3]&D[2]&~D[1] | D[3]&D[1];
    assign g = D[1]&~D[0] | D[3]&D[0] | D[3]&~D[2]&~D[1] |~D[3]&D[2]&~D[1] | ~D[3]&~D[2]&D[1];
    assign dp = D[3]&D[2] | D[3]&~D[2]&D[1];
    /*
    assign seg[0] = ~D[3]&~D[2]&~D[0] | D[3]&~D[0] | ~D[3]&D[1] | D[2]&D[1] | ~D[3]&D[2]&D[0] | D[3]&~D[2]&~D[1];
    assign seg[1] = ~D[3]&~D[2] | ~D[3]&~D[1]&~D[0] | ~D[3]&D[1]&D[0] | D[3]&~D[1]&D[0] | D[3]&~D[2]&~D[0];
    assign seg[2] = ~D[3]&~D[1] | ~D[3]&D[0] | ~D[3]&D[2] | ~D[1]&D[0] | D[3]&~D[2];
    assign seg[3] = D[3]&~D[1] | D[2]&~D[1]&D[0] | D[2]&D[1]&~D[0] | ~D[2]&D[1]&D[0] | ~D[3]&~D[2]&~D[0];
    assign seg[4] = ~D[2]&~D[0] | D[3]&D[2] | D[1]&~D[0] | D[3]&D[1]&D[0];
    assign seg[5] = ~D[1]&~D[0] | D[3]&~D[2] | D[2]&D[1]&~D[0] | ~D[3]&D[2]&~D[1] | D[3]&D[1];
    assign seg[6] = D[1]&~D[0] | D[3]&D[0] | D[3]&~D[2]&~D[1] |~D[3]&D[2]&~D[1] | ~D[3]&~D[2]&D[1];
    assign seg[7] = D[3]&D[2] | D[3]&~D[2]&D[1];
    */
endmodule
