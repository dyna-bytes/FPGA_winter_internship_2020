`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/24 16:48:57
// Design Name: 
// Module Name: decoder_3to8
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


module decoder_3to8(
    input a, b, c,
    output [7:0] z
    );
    wire [3:0] y1, y2;
    
    decoder dec1(.a(a), .b(b), .en(c), .y(y1));
    decoder dec2(.a(a), .b(b), .en(~c), .y(y2));
    
    assign z = {y2, y1};
    
endmodule
