`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 17:16:35
// Design Name: 
// Module Name: flipflop_tb
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


module flipflop_tb();
    reg clk, d;
    wire n,nbar,q,qbar;
    
    //flipflop u_ff(clk,d,q,qbar);
    flipflop u_ff(clk,d,n,nbar,q,qbar);
    
    initial begin
        clk = 0; d = 0;
        #100 $stop;
    end
    
    always begin
        #5 clk = ~clk;
    end
    
    always begin
        #10 d = ~d;
    end
endmodule
