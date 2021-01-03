`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/31 16:22:14
// Design Name: 
// Module Name: timer
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


module timer(
    input clk, reset,
    input [18:0] sec_count,
    input stop,
    output reg [3:0] d, e, f, g, h, i
    );
    
parameter sec = 19'd499_999;
parameter adjustment_factor_for_tb = 400_000;
    
 always @(posedge clk or posedge reset)
    if(reset)                          d <= 4'b0;
    else if((d == 4'b1001) || stop)    d <= 4'b0;
    else if(sec_count == sec/adjustment_factor_for_tb)  d <= d + 4'b1;
    else ;
    
always @(posedge clk or posedge reset)
    if(reset)                          e <= 4'b0;
    else if(((e == 4'b1001) && (d==4'b1001)) || stop)    e <= 4'b0;
    else if(d == 4'b1001)              e <= e + 4'b1;
    else ;  

always @(posedge clk or posedge reset)
    if(reset)                          f <= 4'b0;
    else if(((f == 4'b1001) && (e==4'b1001) && (d==4'b1001)) || stop)    f <= 4'b0;
    else if((e==4'b1001) && (d==4'b1001))              f <= f + 4'b1;
    else ;   

always @(posedge clk or posedge reset)
    if(reset)                          g <= 4'b0;
    else if(((g == 4'b0110) && (f==4'b1001) && (e==4'b1001) && (d==4'b1001)) || stop)    g <= 4'b0;
    else if((f==4'b1001) && (e==4'b1001) && (d==4'b1001))              g <= g + 4'b1;
    else ;    
    
always @(posedge clk or posedge reset)
    if(reset)                          h <= 4'b0;
    else if(((h==4'b1001) && (g==4'b0110) && (f==4'b1001) && (e==4'b1001) && (d==4'b1001)) || stop)    h <= 4'b0;
    else if((g==4'b0110) && (f==4'b1001) && (e==4'b1001) && (d==4'b1001))              h <= h + 4'b1;
    else ;     
    
always @(posedge clk or posedge reset)
    if(reset)                          i <= 4'b0;
    else if(((i==4'b0110) && (h==4'b1001) && (g==4'b0110) && (f==4'b1001) && (e==4'b1001) && (d==4'b1001)) || stop)    i <= 4'b0;
    else if((h==4'b1001) && (g==4'b0110) && (f==4'b1001) && (e==4'b1001) && (d==4'b1001))              i <= i + 4'b1;
    else ; 
    
endmodule
