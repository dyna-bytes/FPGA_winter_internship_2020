`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 17:20:23
// Design Name: 
// Module Name: dff
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


module dff(
    input clk, reset, d,
    output reg q,
    output qbar
    );
    
    always @ (posedge clk or posedge reset) begin
        if (reset) q <= 1'b0;
        else q <= d;
    end
    
    assign qbar = ~q;
    
endmodule
