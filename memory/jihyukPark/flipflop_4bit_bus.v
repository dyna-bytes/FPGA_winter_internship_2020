`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 18:34:51
// Design Name: 
// Module Name: flipflop_4bit_bus
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


module flipflop_4bit_bus(
    input clk, reset, en,
    input [3:0] d,
    output reg [3:0] q, qbar
    );
    
    //asynchronous reset and enable
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0;
        else begin
            if (en) q <= d;
            else;
        end
        
        qbar <= ~q;
    end
endmodule
