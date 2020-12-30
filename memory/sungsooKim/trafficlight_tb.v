`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 17:29:29
// Design Name: 
// Module Name: trafficlight_tb
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


module trafficlight_tb();
    reg clk, reset;
    reg [1:0] t;
    wire [1:0] a,b;
    wire [1:0] c;
    wire [1:0] sa, sb;

    trafficlight u_tl(.clk(clk),.t(t),.reset(reset),.a(a),.b(b),.c(c),.sa(sa),.sb(sb));
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
        t = 2'b00; #20;
        t = 2'b01; #20;
        t = 2'b10; #20;
        t = 2'b11; #20;
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
    /*
    parameter s0 = 2'b00;
    parameter s1 = 2'b01; 
    parameter s2 = 2'b11; 
    parameter s3 = 2'b10; 
    parameter r = 2'b00;
    parameter y = 2'b01;
    parameter g = 2'b10;
   
    reg [1:0] sa,sb;
    always @(c) begin
    if (c==s0) begin
        sa = g;
        sb = r;
    end
    if (c==s1) begin
        sa = y;
        sb = r;
    end
    if (c==s2) begin
        sa = r;
        sb = g;
    end   
    if (c==s3) begin
        sa = r;
        sb = y;
    end   
    end
    */
    // trigger timing and output timing is different (?)
endmodule
