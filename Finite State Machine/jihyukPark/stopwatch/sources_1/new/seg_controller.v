`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/31 14:47:15
// Design Name: 
// Module Name: seg_controller
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


module seg_controller(clk, reset, d, e, f, g, h, i, seg, seg_sel);

input clk;
input reset;
input [3:0] d, e, f, g, h, i;
output [7:0] seg;
output [5:0] seg_sel;

parameter N = 10;
wire [N-1:0] count;
wire [3:0] data;

counter U1_counter(.clk(clk), .reset(reset), .count(count));
segment_fsm     U0_fsm(.clk(clk), .reset(reset), .d(d), .e(e), .f(f), .g(g), .h(h), .i(i),.count(count),      .data(data), .seg_sel(seg_sel));
seg_7   U0_seg_7(.d(data), .seg(seg));

endmodule
