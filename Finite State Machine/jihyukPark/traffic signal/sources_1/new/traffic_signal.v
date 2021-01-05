`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 17:19:57
// Design Name: 
// Module Name: traffic_signal
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


module traffic_signal(
    input TA, TB, clk, reset,
    output [1:0] SA, SB
    );

    // a = out[1], b = out[0];
    // a_next = in[1], b_next = in[0];
    wire a, a_bar, a_next, b, b_bar, b_next;
    wire c, d; // c = SA[1], d = SA[0];
    wire e, f; // e = SB[1], f = SB[0];
    
    // status register
    dff dff1(.clk(clk), .reset(reset), .d(a_next), .q(a), .qbar(a_bar));
    dff dff2(.clk(clk), .reset(reset), .d(b_next), .q(b), .qbar(b_bar));
    
    // next state logic
    assign a_next = b;
    assign b_next = (a_bar & ~TA) | (a_bar & b) | (b & TB);
    
    // output logic
    assign c = a_bar & b_bar;
    assign d = a_bar & b;
    assign e = a & b;
    assign f = a & b_bar;
    
    assign SA = {c, d};
    assign SB = {e, f};
    
endmodule
