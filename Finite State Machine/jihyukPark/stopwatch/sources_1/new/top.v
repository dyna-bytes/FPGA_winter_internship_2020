`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/31 17:48:29
// Design Name: 
// Module Name: top
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


module top(
    input clk, reset,
    input start, stop,
    
   // output [3:0] d, e, f, g, h, i,
    output [7:0] seg,
    output [5:0] seg_sel
    );
    
   wire d, e, f, g, h, i;
stopwatch_top    stopwatch_top(.clk(clk), .reset(reset), .start(start), .stop(stop),     .d(d),.e(e),.f(f),.g(g),.h(h),.i(i));
seg_controller   seg_controller(.clk(clk), .reset(reset),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i),      .seg(seg), .seg_sel(seg_sel));

endmodule
