`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 19:27:56
// Design Name: 
// Module Name: sregisterb
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


module sregisterb(
    clk,reset,load,sin,d,q,sout
    );
    parameter N = 8;
    input clk,reset,load,sin;
    input [N-1:0] d;
    output reg [N-1:0] q;
    output sout;
    
    assign sout = q[0];
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            q <= 0;
        end 
        else begin
            if (load) q <= d;
            else q <= {sin,q[N-1:1]};
        end
    end
endmodule
