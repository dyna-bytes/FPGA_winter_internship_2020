`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 19:32:26
// Design Name: 
// Module Name: sregisterb_tb
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


module sregisterb_tb();
    parameter N = 8;
    reg clk,reset,load,sin;
    reg [N-1:0] d;
    wire [N-1:0] q;
    wire sout;

    sregisterb u_sregb(.sin(sin),.clk(clk),.reset(reset),.sout(sout),.q(q),.load(load),.d(d));
    
    parameter clk_period = 10;

    always begin
        clk = 1;
        forever #(clk_period/2) clk = ~clk;
    end
    initial begin
//        #5 sin = 1'b0;
//        #5 sin = 1'b1; 
//        #(clk_period*2) reset = 0;
//        #(clk_period*2.5) reset = 1;
        load = 0;
        reset = 0;
        d = 8'b1001_1001;
    end
    always begin
        #20 sin = 1'b0;
        #20 sin = 1'b1; 
    end  
//    always begin
//        load = 1;
//        forever #(clk_period*10) load = ~load;
//    end
//    always begin    
//       if( sin <= 4'b1111 )
//        #10 sin  = sin + 4'b0001;
//       else
//        #10 sin  = 4'b0000;     
//    end 
endmodule
