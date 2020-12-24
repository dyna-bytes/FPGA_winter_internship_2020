`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/24 18:33:57
// Design Name: 
// Module Name: fulladder
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


module fulladder(
    input a, b, cin,
    output sum, cout
);
 
    wire sum1;
    wire cout1, cout2;
        
    halfadder u_halfadder1(a, b, sum1, cout1);
    halfadder u_halfadder2(sum1, cin, sum, cout2);
    
    assign cout = cout1 | cout2;

endmodule
