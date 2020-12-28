`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 15:56:36
// Design Name: 
// Module Name: srlatch
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

module srlatch(
  input R, S,
  output Q, Qbar  
);

  assign Q = ~(R | Qbar);
  assign Qbar = ~(S | Q);
  
endmodule

