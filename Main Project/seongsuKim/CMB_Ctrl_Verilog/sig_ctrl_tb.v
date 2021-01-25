`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/20 13:14:24
// Design Name: 
// Module Name: sig_ctrl_tb
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


module sig_ctrl_tb();
    reg clk, sig;
    wire sig_control;
    
    sig_ctrl sig_ctrl(.clk(clk),.sig(sig),.sig_ctrl(sig_control));
    
    always begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    always begin
        sig = 0;
        forever #40 sig = ~sig;
    end
endmodule
