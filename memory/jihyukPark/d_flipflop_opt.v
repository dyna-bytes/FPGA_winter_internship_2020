`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 17:44:20
// Design Name: 
// Module Name: d_flipflop_opt
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


module d_flipflop_opt(
    input clk, d,
    output reg q,
    output qbar
    );
    
    always @ (posedge clk) begin
        q <= d;  
    end
    
    assign qbar = ~q;
    
endmodule
