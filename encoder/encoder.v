`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/24 16:16:41
// Design Name: 
// Module Name: encoder
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


module encoder(
    input [7:0] y,
    output a,b,c   
    );
    
    assign a = y[1]+y[3]+y[5]+y[7];
    assign b = y[2]+y[3]+y[6]+y[7];    
    assign c = y[4]+y[5]+y[6]+y[7];  
    
endmodule
