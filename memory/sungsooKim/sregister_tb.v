`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 18:34:11
// Design Name: 
// Module Name: sregister_tb
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


module sregister_tb();
    reg [3:0] sin;
    reg clk, reset;
    wire [3:0] sout,q1,q2,q3;

    sregister u_sreg(.sin(sin),.clk(clk),.reset(reset),.sout(sout),.q1(q1),.q2(q2),.q3(q3));
    
    parameter clk_period = 10;

    always begin
        clk = 1;
        forever #(clk_period/2) clk = ~clk;
    end
    initial begin
        sin = 4'b0000; 
//        #(clk_period*2) reset = 0;
//        #(clk_period*2.5) reset = 1;
        reset = 1;
    end
    always begin    
       if( sin <= 4'b1111 )
        #10 sin  = sin + 4'b0001;
       else
        #10 sin  = 4'b0000;     
    end 

endmodule
