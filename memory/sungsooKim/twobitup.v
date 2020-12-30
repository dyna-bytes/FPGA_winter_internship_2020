`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 13:40:33
// Design Name: 
// Module Name: twobitup
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


module twobitup(
    input clk, t, reset, // t is trigger
    output [1:0] a,b // a is first site number, b is second site number
    );
    assign a[1] = (a[0] & ~t)|(a[0] & ~b[0]&t)|(~a[0]&b[0]&t);
    assign b[1] = (b[0] & ~t)|(~b[0] & t);
//    always begin
//        a[1] = (a[0] & t)|(a[0] & ~b[0])|(~a[0]&b[0]&t);
//        b[1] = (b[0] & ~t)|(~b[0] & t);
//    end
    ff u_ff1(.clk(clk),.reset(reset),.d(a[1]),.q(a[0]));
    ff u_ff2(.clk(clk),.reset(reset),.d(b[1]),.q(b[0]));
        
        
endmodule
