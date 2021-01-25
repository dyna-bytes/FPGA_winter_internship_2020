`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/19 15:40:11
// Design Name: 
// Module Name: tb_clk_cntr_top
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


module tb_clk_cntr_top();

reg clk, rst;
wire o_clk;

clk_cntr_top UUT(.fpga_clk(clk), .rst(rst), .clk_1Hz(o_clk));

parameter clk_period = 10;

initial clk = 1'b0;
always clk = #(clk_period/2) ~clk;

initial begin
    rst = 1;
    #3 rst = 0;
    #10 rst = 1;
end


endmodule
