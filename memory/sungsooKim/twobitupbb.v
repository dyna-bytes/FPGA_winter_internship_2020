`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 15:29:57
// Design Name: 
// Module Name: twobitupbb
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


module twobitupbb(
    clk, reset,c
    );
    parameter N = 2;
    input clk, reset;
    output reg [N-1:0] c;
    
    always @(posedge clk, posedge reset) begin
        if (reset) c <= 0; 
        else c <= c+1'b1;
    end
endmodule
