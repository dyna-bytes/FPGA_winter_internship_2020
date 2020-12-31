`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 19:05:44
// Design Name: 
// Module Name: isregister_tb
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


module isregister_tb();
    reg [3:0] sin, d0, d1,d2,d3;
    reg clk, reset, load;
    wire [3:0] q1,q2,q3,sout,out0,out1,out2,out3;

    isregister u_isreg(.sin(sin),.clk(clk),.reset(reset),.d0(d0),.d1(d1),.d2(d2),.d3(d3),.sout(sout),.q1(q1),.q2(q2),.q3(q3),.load(load),.out0(out0),.out1(out1),.out2(out2),.out3(out3));
    
    parameter clk_period = 10;

    always begin
        clk = 1;
        forever #(clk_period/2) clk = ~clk;
    end
    initial begin
        sin = 4'b0000; 
        d0 = 4'b1111;
        d1 = 4'b1110;
        d2 = 4'b1101;
        d3 = 4'b1100;
//        #(clk_period*2) reset = 0;
//        #(clk_period*2.5) reset = 1;
        reset = 1;
    end
    always begin    
       if( sin <= 4'b1011 )
        #10 sin  = sin + 4'b0001;
       else
        #10 sin  = 4'b0000;     
    end 
    always begin
        load = 1;
        forever #(clk_period*10) load = ~load;
    end
endmodule
