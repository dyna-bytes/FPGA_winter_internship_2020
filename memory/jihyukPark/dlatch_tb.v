`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 16:28:18
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
    wire q, qbar;
    
    initial begin
        clk = 0; d = 0;
        #100 $stop;
    end
    
    //dlatch u_d(.clk(clk), .d(d), .q(q), .qbar(qbar));
    dlatch_opt u_d(.clk(clk), .d(d), .q(q), .qbar(qbar));
    
    always begin
        #10 clk = ~clk;
        #5 d = ~d;
    end
    

endmodule
