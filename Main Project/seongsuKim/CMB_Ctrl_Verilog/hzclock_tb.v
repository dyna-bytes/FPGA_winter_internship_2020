`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/19 15:30:02
// Design Name: 
// Module Name: hzclock_tb
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


module hzclock_tb();
    reg clk, reset;
    wire outclk;

    hzclock hzclock(.clk(clk),.reset(reset),.outclk(outclk));

    initial begin
        reset = 1;
//        #10 reset = 1;
//        #20 reset = 0;
    end

    always begin
        clk = 0;
        forever # 10 clk = ~clk;
    end
endmodule
