`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/15 16:02:59
// Design Name: 
// Module Name: hzclock
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


module hzclock
    #(parameter clk_period_i = 10,
    parameter clk_period_f = 10**9,
    parameter clk_cnt = clk_period_f/clk_period_i)// in ns
    (input clk, reset,
    output reg outclk
    );

//    parameter clk_cnt = clk_period_f/clk_period_i;
    reg [27:0] det; 
    
    always @(posedge clk) begin
        if (reset) det = 0;
        else begin
            if (det < clk_cnt-1) det <= det + 1'b1;
            else det <= 0;
        end 
    end
    
    always @(posedge clk) begin
        if (reset) outclk = 0;
        else begin
            if (det < clk_cnt/2) outclk <= 1;
            else outclk <= 0;
        end
    end
endmodule
