`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/20 18:32:06
// Design Name: 
// Module Name: LED8_counter
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


module LED8_counter(
    input sys_init_ctrl,
    input fpga_clk,
    input clk_1Hz,
    output reg [3:0] led,
    
    input sys_init,
    input trg,
    input rot_en,
    input wrk_stat
    );
      
    always @(posedge fpga_clk) begin
        led[3] <= sys_init;
        led[2] <= trg;
        led[1] <= rot_en;
        led[0] <= wrk_stat;
    end 
    
    
endmodule
