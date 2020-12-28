`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 21:27:07
// Design Name: 
// Module Name: register
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


module register(
    input clk, reset,
    input [7:0] d,
    output reg [7:0] q,
    output reg [7:0] qbar
    );
    
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            q <= 8'b0000_0000; 
            qbar = ~q;
        end
        else begin
            q<=d; 
            qbar = ~q;
        end
    end
endmodule
