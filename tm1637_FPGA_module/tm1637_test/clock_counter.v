`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/06 13:06:31
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


module clock_counter
    #(
    parameter from = 100, // 100Hz
    parameter to = 1      // 1Hz
    )(
    input i_clk,
    output reg o_clk
    );
    
    localparam integer N = from / to;
    localparam void = 0;
    
    // ---- another way to get MSB of N ----    
    parameter MSB = N >> 4 ? (N >> 4 ? (N >> 4 ? (N >> 4 ? (N >> 4 ? (N >> 4 ? (N >> 4 ? (N >> 4 ? 
    36 : 32) : 28) : 24) : 20) : 16) : 12) : 8) : 4;    // Find the maximum possible number of bits up to N < 2**36
    reg [MSB - 1 : 0] cnt;
    
    always @(posedge i_clk)
    begin
        if(cnt == (N - 1)) cnt <= 1;
        else cnt <= cnt + 1;
        
        if( cnt <= (N/2 - 1)) o_clk <= 1;
        else if(cnt <= (N - 1)) o_clk <= 0;
        else o_clk <= 1;
    end
    
    
    

endmodule

