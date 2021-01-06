`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/06 13:59:38
// Design Name: 
// Module Name: clock_counter
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




module clock_counter #(
    parameter from = 100, // 100Hz
    parameter to = 1      // 1Hz
    )(
    input i_clk, reset,
    output reg o_clk
    );
    
    parameter N = from / to;    // N is better to be an even number
    parameter MSB = N >> 4 ? (N >> 4 ? (N >> 4 ? (N >> 4 ? (N >> 4 ? (N >> 4 ? (N >> 4 ? (N >> 4 ? 
    36 : 32) : 28) : 24) : 20) : 16) : 12) : 8) : 4;    // Find the maximum possible number of bits up to N < 2**36
    reg [MSB - 1 : 0] cnt;
    
    always @(posedge i_clk or negedge reset)
        if(!reset || cnt == (N - 1)) cnt <= 0;
        else cnt <= cnt + 1;
    
    always @(posedge i_clk)
        if( cnt <= (N/2 - 1)) o_clk <= 0;
        else if(cnt <= (N - 1)) o_clk <= 1;
        else o_clk <= 0;
    
endmodule
