`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/15 16:05:06
// Design Name: 
// Module Name: sig_ctrl
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


module sig_ctrl(
    input clk, sig,
    output sig_ctrl
    );
    
   reg sig_b;
    
    always @ (posedge clk) begin
        sig_b <= sig;
    end
    
    assign sig_ctrl = sig & ~sig_b;
endmodule