`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/05 17:06:28
// Design Name: 
// Module Name: cntr_1KHz
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

// Generation of 1KHz clock from 1MHz clock
module cntr_1KHz(
    input clk, reset,
    output reg o_clk
    );
    
    parameter N = 10;
    parameter M = 1000;
    reg [N-1:0] cnt;
    
    always @(posedge clk or negedge reset) begin
        if(!reset || cnt == (M - 1)) cnt <= 0;
        else cnt <= cnt + 1;
    end
    
    always @(posedge clk) begin
        if( cnt <= (M/2 - 1)) o_clk <= 0;
        else if(cnt <= (M - 1)) o_clk <= 1;
        else o_clk <= 0;
    end
    
endmodule
