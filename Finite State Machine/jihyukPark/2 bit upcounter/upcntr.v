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
    input clk, reset, 
    input in,
    output out
    );
    /*  
    assign in[1] = (out[1] & trigger) | (out[1] & ~out[0]) | (~out[1] & out[0] & trigger); 
    assign in[0] = (out[0] & ~trigger) | (~out[0] & trigger);
    */
    
   
     assign in = ~out;
 
    
  //  d_flipflop dff_A(.clk(clk), .reset(reset), .d(in[1]), .q(out[1]) );
    d_flipflop dff_B(.clk(clk), .reset(reset), .d(in), .q(out) );   
endmodule
