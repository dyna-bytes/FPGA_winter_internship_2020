`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/20 14:14:28
// Design Name: 
// Module Name: obs_tb
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


module obs_tb();
    reg sys_init_ctrl, stp_clk, trg_ctrl;
    reg [7:0] sw;
    wire rot_en, wrk_stat, adc_en;
    wire [3:0] rf_sw;
    wire [9:0] rot_count;
    
    obs obs(.sys_init_ctrl(sys_init_ctrl),.stp_clk(stp_clk),.trg_ctrl(trg_ctrl),.sw(sw),.rot_en(rot_en)
        ,.wrk_stat(wrk_stat),.adc_en(adc_en),.rf_sw(rf_sw),.rot_count(rot_count));
    
    always begin
        stp_clk = 0;
        forever #5 stp_clk = ~stp_clk;
    end
    
    initial begin
        trg_ctrl = 1;
        sw = 8'b0000_0000;
        sys_init_ctrl = 1;
        #10 sys_init_ctrl = 0;
    end
endmodule
