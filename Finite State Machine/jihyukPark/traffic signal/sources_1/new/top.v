`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/05 13:36:41
// Design Name: 
// Module Name: top
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


module top(input TA, TB, clk, reset,
    output [1:0] SA, SB
    );
    
    traffic_signal U0(.TA(TA), .TB(TB), .clk(clk), .reset(reset), .SA(SA), .SB(SB));
    
    wire void_SA, void_SB;
    traffic_signal_ver2 U1(.TA(TA), .TB(TB), .clk(clk), .reset(reset), .SA(void_SA), .SB(void_SB));
    
endmodule
