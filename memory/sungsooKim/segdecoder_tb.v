`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 12:22:10
// Design Name: 
// Module Name: segdecoder_tb
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


module segdecoder_tb();
    reg [3:0] data;
    wire [6:0] seg;

    segdecoder u_sd(data,seg);

    initial begin
        data = 4'b0000;
        #100 $stop;
    end
    
    always begin    
       if( data <= 4'b1111 )
        #4 data  =data + 4'b0001;
       else
        #4 data  = 4'b0000;     
    end 
endmodule
