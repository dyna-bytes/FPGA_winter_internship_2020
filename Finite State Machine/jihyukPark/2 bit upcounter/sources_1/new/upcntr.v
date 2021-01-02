`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 13:40:42
// Design Name: 
// Module Name: upcntr
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


module upcntr(
    input clk, reset, trigger,
    output [1:0] state
    );
   // wire [1:0] state;   
    wire [1:0] next_state;  
 
    assign next_state[1] = (state[1] & ~trigger) | (state[1] & ~state[0] & trigger) | (~state[1] & state[0] & trigger);
    assign next_state[0] = (state[0] & ~trigger) | (~state[0] & trigger);

    d_flipflop dff_A(.clk(clk), .reset(reset), .d(next_state[1]), .q(state[1]) );
    d_flipflop dff_B(.clk(clk), .reset(reset), .d(next_state[0]), .q(state[0]) );   
    
endmodule
