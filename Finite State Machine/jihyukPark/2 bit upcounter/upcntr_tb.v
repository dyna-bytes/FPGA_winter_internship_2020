`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 13:59:03
// Design Name: 
// Module Name: upcntr_tb
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


module upcntr_tb();
    reg clk, reset;
    reg  data;
    wire out;
    
    parameter clk_period = 10;
    
    upcntr up_counter(.clk(clk), .reset(reset), .in(data), .out(out));
    
    initial begin reset = 1;
               #5 reset = 0;
    end
    
    initial clk = 1'b0;
    always #10 clk = ~clk;
    
    initial data = 1'b0;
    

endmodule
