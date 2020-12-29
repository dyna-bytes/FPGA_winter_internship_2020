`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 19:11:10
// Design Name: 
// Module Name: shift_reg_ver2
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


module shift_reg_ver2(
    input clk, reset, sin, load,
    input [3:0] D,
    output reg [3:0] Q,
    output sout
    );
    
    assign sout = Q[0];
    
    always @ ( posedge clk or posedge reset) begin
        if (reset) Q <= 0;
        else begin
            if (load) Q <= D;
            else Q <= {sin, Q[3:1]};
        end
    end
    
endmodule
