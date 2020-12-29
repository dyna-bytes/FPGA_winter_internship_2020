`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 18:26:51
// Design Name: 
// Module Name: shift_reg
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

module shift_reg(
    input clk, reset, load, sin,
    input [3:0] D,
    output [3:0] Q,
    output sout
    );
    wire [3:0] N; //net
    
    mux_2to1 mux0(.a(Q[1]), .b(D[0]), .sel(load), .out(N[0]));
    mux_2to1 mux1(.a(Q[2]), .b(D[1]), .sel(load), .out(N[1]));
    mux_2to1 mux2(.a(Q[3]), .b(D[2]), .sel(load), .out(N[2]));
    mux_2to1 mux3(.a(sin),  .b(D[3]), .sel(load), .out(N[3]));  
     
    dff dff0(.clk(clk), .reset(reset), .d(N[0]), .q(Q[0]));
    dff dff1(.clk(clk), .reset(reset), .d(N[1]), .q(Q[1]));
    dff dff2(.clk(clk), .reset(reset), .d(N[2]), .q(Q[2]));
    dff dff3(.clk(clk), .reset(reset), .d(N[3]), .q(Q[3]));

    assign sout = Q[0];
    
endmodule
