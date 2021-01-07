`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 17:17:51
// Design Name: 
// Module Name: trafficlight
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


module trafficlight(
    input clk, reset, 
    input [1:0] t,
//    output [1:0] a,b, c,// a is first site number, b is second site number
    output reg [1:0] sa, sb
    );
    
    wire [1:0] a,b, c;
    
    assign a[1] = b[0];
    assign b[1] = (~a[0]&~t[1])|(~a[0]&b[0])|(b[0]&t[0]);
    ff u_ff1(.clk(clk),.reset(reset),.d(a[1]),.q(a[0]));
    ff u_ff2(.clk(clk),.reset(reset),.d(b[1]),.q(b[0]));    
    assign c = {a[0],b[0]}; 
    
    parameter s0 = 2'b00;
    parameter s1 = 2'b01; 
    parameter s2 = 2'b11; 
    parameter s3 = 2'b10; 
    parameter r = 2'b00;
    parameter y = 2'b01;
    parameter g = 2'b10;
   
//    reg [1:0] sa,sb;
    always @(c) begin
    if (c==s0) begin
        sa = g;
        sb = r;
    end
    if (c==s1) begin
        sa = y;
        sb = r;
    end
    if (c==s2) begin
        sa = r;
        sb = g;
    end   
    if (c==s3) begin
        sa = r;
        sb = y;
    end   
    end
endmodule
