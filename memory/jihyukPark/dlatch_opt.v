`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 16:47:00
// Design Name: 
// Module Name: dlatch_opt
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

module dlatch_opt(
    input clk, d, 
    output reg q, qbar
);

always @(clk or d)
begin
  if(clk) q = d;
  qbar = ~q;
end

endmodule