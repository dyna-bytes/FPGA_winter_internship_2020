`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/20 17:00:57
// Design Name: 
// Module Name: led_counter
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


module led_counter(
    input clk50, sys_init_ctrl, hertz_clk,
    output reg [7:0] led
    );
    
    always @(posedge clk50) begin
        if (sys_init_ctrl == 1) led <= 8'b0000_0000;
        else;
    end
    always @(posedge hertz_clk) begin
        if (sys_init_ctrl !== 1) begin
            led <= led + 8'b0000_0001;
            if (led == 8'b1111_1111) led <= 8'b0000_0000; 
            else;
        end 
        else;
    end
endmodule
