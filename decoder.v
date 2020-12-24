simple decoder

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/24 16:39:52
// Design Name: 
// Module Name: decoder
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


module decoder(
    input a,b,en,
    output [3:0] y
    );
    
    assign y[0]= en & ~a & ~b;
    assign y[1]= en & a & ~b;
    assign y[2]= en & ~a & b;
    assign y[3]= en & a & b; 
    
endmodule
