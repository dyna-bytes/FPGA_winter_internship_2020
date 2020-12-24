`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/23 17:15:25
// Design Name: 
// Module Name: lgates_tb
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


module lgates_tb();
 reg [1:0] s; // switch
 wire [3:0] l; // LED

 lgates ugates(.switch(s), .led(l));

 initial
 begin
 s[1] = 0; s[0] = 0;
 # 20 s[1] = 1;
 # 20 s[1] = 0; s[0] = 1;
 # 20 s[1] = 1; s[0] = 1;
 # 20 $finish;
 end

endmodule
