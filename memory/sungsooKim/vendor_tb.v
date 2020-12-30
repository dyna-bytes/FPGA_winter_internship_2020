`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/30 16:34:07
// Design Name: 
// Module Name: vendor_tb
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


module vendor_tb();
    reg clk,reset, c, f, p;
    wire [1:0] a,b,m,led,out;

    vendor u_v(.clk(clk),.reset(reset),.c(c),.f(f),.p(p),.a(a),.b(b),.m(m),.led(led),.out(out));
    
    parameter clk_period = 40;

//    assign a = 2'b00;
//    assign b = 2'b00; //assign makes problem(why?)

    always begin
        clk = 0;
        forever #(clk_period/2) clk = ~clk;
    end
    
    initial begin
        #(clk_period*1) reset = 0;
        #(clk_period*0.5) reset = 1;
//        reset = 1;
    end
    initial begin
        c = 0; f = 0; p = 0;
    end
    initial begin
        #(clk_period*2) c = 0; f = 1; p = 0;
        #(clk_period) c = 0; f = 0; p = 1;   
             
        #(clk_period) c = 1; f = 0; p = 0;
        #(clk_period) c = 0; f = 1; p = 0;
        
        #(clk_period) c = 1; f = 0; p = 0;
        #(clk_period) c = 0; f = 0; p = 1;
        
        #(clk_period) c = 1; f = 0; p = 0;  
        #(clk_period) c = 0; f = 1; p = 0;
        #(clk_period) c = 0; f = 1; p = 0;
        
        #(clk_period) c = 1; f = 0; p = 0;  
        #(clk_period) c = 1; f = 0; p = 0;  
        #(clk_period) c = 0; f = 0; p = 1;
        
        #(clk_period) c = 1; f = 0; p = 0; 
        #(clk_period) c = 0; f = 1; p = 0;
        #(clk_period) c = 0; f = 1; p = 0;
        #(clk_period) c = 0; f = 1; p = 0;

        #(clk_period) c = 1; f = 0; p = 0; 
        #(clk_period) c = 1; f = 0; p = 0; 
        #(clk_period) c = 1; f = 0; p = 0; 
        #(clk_period) c = 0; f = 0; p = 1;
    end
endmodule
