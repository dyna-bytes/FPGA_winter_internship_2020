`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 14:00:19
// Design Name: 
// Module Name: twobitup_tb
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


module twobitup_tb();
    reg clk, t, reset;
    wire [1:0] a,b;
    wire [1:0] c;

    twobitup u_tbu(.clk(clk),.t(t),.reset(reset),.a(a),.b(b));
//    initial begin
//        a = 2'b00;
//        b = 2'b00;
//    end
    
    parameter clk_period = 40;

    always begin
        clk = 0;
        forever #(clk_period/2) clk = ~clk;
    end
    always begin
        t = 1'b1; #20;
        t = 1'b0; #80;
    end
    
    initial begin
        #(clk_period*2) reset = 0;
        #(clk_period*2.5) reset = 1;
    end
//    always begin
//        #(clk_period*4) reset = 0;
//        #(clk_period*4.5) reset = 1;
////        reset=0;
////        forever #(clk_period*4) reset = ~reset;
//    end
    assign c = {a[0],b[0]}; 

    // trigger timing and output timing is different (?)
endmodule
