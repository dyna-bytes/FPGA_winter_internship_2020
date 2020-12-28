`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 16:19:19
// Design Name: 
// Module Name: dlatch_tb
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


module dlatch_tb();
    reg clk,d;
    wire r,s;
    wire q,qbar;
    
    dlatch u_dlatch(clk,d,q,qbar,r,s);
    
    initial begin
        clk = 0; d = 0;
        #100 $stop;
    end
    
    always begin
        #10 clk = ~clk;
        #5 d = ~d;
    end
endmodule
