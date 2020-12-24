`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/23 17:23:34
// Design Name: 
// Module Name: lgates
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

module lgates(
 input [1:0] switch,
 output [3:0] led
 );
 assign led[0] = switch[0] & switch[1]; // and
 assign led[1] = switch[0] | switch[1]; // or
 assign led[2] = switch[0] ^ switch[1]; // xor
 assign led[3] = ~led[0];
endmodule
