`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/24 16:56:42
// Design Name: 
// Module Name: decoder_3to8_tb
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


module decoder_3to8_tb();

    reg a, b, c;
    wire [7:0] z;
    
    decoder_3to8 u_dec_3to8(a, b, c, z);
    
    initial begin
        a = 0; b = 0; c = 0;
        #80 $stop;
    end
    
    always begin
       #4 a = 0;
       #4 a = 1;
    end 
    
    always begin
       #2 b = 0;
       #2 b = 1;
    end
    
    always begin
       #1 c = 0;
       #1 c = 1;
    end
endmodule
