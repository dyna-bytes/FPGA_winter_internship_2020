`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/31 16:47:09
// Design Name: 
// Module Name: stopwatch_top
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


module stopwatch_top(
    input clk, reset, start, stop,
    output [3:0] d,e,f,g,h,i
    );
    
 wire [18:0] sec_count;
 wire [1:0] en;
 
 sec_counter sec_counter(.clk(clk), .reset(reset), .en(en), .sec_count(sec_count));
 stopwatch_fsm stopwatch_fsm(.clk(clk), .reset(reset), .start(start), .stop(stop), .en(en));
 timer timer(.clk(clk), .reset(reset), .sec_count(sec_count), .stop(stop), .d(d), .e(e), .f(f), .g(g), .h(h), .i(i));
    
endmodule
