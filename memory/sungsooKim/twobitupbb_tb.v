`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 15:41:26
// Design Name: 
// Module Name: twobitupbb_tb
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


module twobitupbb_tb();
    reg clk, reset;
    wire [1:0] c;
    
    twobitupbb u_tbubb(.clk(clk),.reset(reset),.c(c));

    parameter clk_period = 10;
    
    always begin
        clk = 1;
        forever #(clk_period/2) clk = ~clk;
    end
    always begin
        reset = 1;
        forever #(clk_period*4) reset = ~reset;
    end
endmodule
