`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/24 19:01:24
// Design Name: 
// Module Name: ripple_carry_adder
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


module ripple_carry_adder(
    input [3:0] A, B,
    output [3:0] S,
    output C
    );
    
    wire C0, C1, C2;
    
    fulladder fa1( .a(A[0]), .b(B[0]), .cin(1'b0), .sum(S[0]), .cout(C0));
    fulladder fa2( .a(A[1]), .b(B[1]), .cin(C0), .sum(S[1]), .cout(C1));
    fulladder fa3( .a(A[2]), .b(B[2]), .cin(C1), .sum(S[2]), .cout(C2));
    fulladder fa4( .a(A[3]), .b(B[3]), .cin(C2), .sum(S[3]), .cout(C));
    
endmodule
