`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/30 14:53:29
// Design Name: 
// Module Name: seg_7
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


module seg_7(
    input [3:0] d,  //4 bit input data
    output [7:0] seg//16 output datas. 0~9,a,b,c,d,e,f
    );
    
    assign seg[0] = (~d[3]&~d[2]&~d[0]) | (d[3]&~d[0]) | (~d[3]&d[1]) | ( d[2]&d[1] ) | (~d[3]&d[2]&d[0])
    | (d[3]&~d[2]&~d[1]); //a
    assign seg[1] = (~d[3]&~d[2]) | (~d[3]&~d[1]&~d[0]) | (~d[3]&d[1]&d[0]) | (d[3]&~d[1]&d[0] ) |
    (d[3]&~d[1]&d[0]) | (d[3]&~d[2]&~d[0]); //b
    assign seg[2] = (~d[3]&~d[1]) | (~d[3]&d[0]) | (~d[3]&d[2]) | (~d[1]&d[0]) | (d[3]&~d[2]); //c
    assign seg[3] = (d[3]&~d[1]) | (d[2]&~d[1]&d[0]) | (d[2]&d[1]&~d[0]) | (~d[2]&d[1]&d[0]) | (~d[3]&~d[2]&~d[0]); //d
    assign seg[4] = (~d[2]&~d[0]) | (d[3]&d[2]) | (d[1]&~d[0]) | (d[3]&d[1]&d[0]); //e
    assign seg[5] = (~d[1]&~d[0]) | (d[3]&~d[2]) | (d[2]&d[1]&~d[0]) | (~d[3]&d[2]&~d[1]) | (d[3]&d[1]);//f
    assign seg[6] = (~d[3]&d[2]&~d[1]) | (~d[3]&~d[2]&d[1]) | (d[1]&~d[0]) | (d[3]&d[0]) | (d[3]&~d[2]&~d[1]);//g
    assign seg[7] = (d[3]&~d[2]&d[1]) | (d[3]&d[2]); //h
    
endmodule
