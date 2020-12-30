`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 18:55:41
// Design Name: 
// Module Name: isregister
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


module isregister(
    input [3:0] sin, d0, d1,d2,d3,
    input clk, reset, load,
    output [3:0] q1,q2,q3,sout,out0,out1,out2,out3
    );
    
    mux u_mux3(.a(d3),.b(sin),.sel(load),.out(out3));
    ff u_ff3(.clk(clk),.reset(reset),.d(out3),.q(q3));
    mux u_mux2(.a(d2),.b(q3),.sel(load),.out(out2));
    ff u_ff2(.clk(clk),.reset(reset),.d(out2),.q(q2));    
    mux u_mux1(.a(d1),.b(q2),.sel(load),.out(out1));
    ff u_ff1(.clk(clk),.reset(reset),.d(out1),.q(q1));    
    mux u_mux0(.a(d0),.b(q1),.sel(load),.out(out0));
    ff u_ff0(.clk(clk),.reset(reset),.d(out0),.q(sout));    
    
endmodule
