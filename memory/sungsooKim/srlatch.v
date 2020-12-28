`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 15:29:58
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
    input r, s,
    output q, qbar  
    );
  
    assign q = ~(r | qbar);
    assign qbar = ~(s | q);
endmodule
