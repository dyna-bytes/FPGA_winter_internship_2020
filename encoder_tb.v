`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/24 16:18:35
// Design Name: 
// Module Name: encoder_tb
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


module encoder_tb(
);
    reg [7:0] y;
    wire a, b, c;
    
    encoder u_enc(y, a, b, c);
    initial begin 
        y = 8'b1000_0000;
        #800 $stop;         
    end
    
    always begin
     #100 y <= y >> 1;
    end
    
    
endmodule
