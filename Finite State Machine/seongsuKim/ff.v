`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 13:49:06
// Design Name: 
// Module Name: ff
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


module ff(
    input clk, reset,
    input d,
    output reg q
    );

    always @(posedge clk, posedge reset) begin
        if (reset) begin 
            q <= d;
        end
        else q <= 0;
    end
endmodule
