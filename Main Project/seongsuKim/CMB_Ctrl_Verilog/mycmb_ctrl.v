`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/13 16:12:36
// Design Name: 
// Module Name: mycmb_ctrl
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


module mycmb_ctrl(
    input clk50, 
    input [3:0] pb, 
    input [7:0] sw,
    output debug, rot_clk, adc_trg,
    output stp_clk,
    output [3:0] digit, rf_sw,
    output [7:0] led, seg,
    output [9:0] rot_count
    
//    input clk50_in, 
//    input [3:0] pb_in, 
//    input [7:0] sw_in,
//    output debug_out, rot_clk_out, stp_clk_out, adc_trg_out,
//    output [3:0] digit_out, rf_sw_out,
//    output [7:0] led_out, seg_out,
//    output [9:0] rot_count_out
    );
    
//    ibuf_lvcmos33(.i(i),.o(o));

    wire rst, sys_init, trg;
    wire [15:0] bcdint;
//    reg debug, rot_clk, adc_trg;


    hzclock #(.clk_period_i(20),.clk_period_f(10**3)) u_clk_50mhz_to_mhz(.clk(clk50),.reset(rst),.outclk(mhertz_clk));
    hzclock #(.clk_period_i(20),.clk_period_f(10**6)) u_clk_50mhz_to_khz(.clk(clk50),.reset(rst),.outclk(khertz_clk));
    hzclock #(.clk_period_i(10**6),.clk_period_f(10**9)) u_clk_khz_to_hz(.clk(khertz_clk),.reset(rst),.outclk(hertz_clk));
    hzclock #(.clk_period_i(10**6),.clk_period_f(10**7)) u_clk_khz_to_100hz(.clk(khertz_clk),.reset(rst),.outclk(stp_clk));
    
    sig_ctrl u_sig_ctrl_sys(.clk(mhertz_clk),.sig(sys_init),.sig_ctrl(sys_init_ctrl));
    sig_ctrl u_sig_ctrl_trg(.clk(mhertz_clk),.sig(trg),.sig_ctrl(trg_ctrl));
    
    obs u_obs(.clk50(clk50),.sys_init_ctrl(sys_init_ctrl),.stp_clk(stp_clk),.trg_ctrl(trg_ctrl),.sw(sw),.rot_en(rot_en),.rf_sw(rf_sw)
        ,.adc_en(adc_en),.wrk_stat(wrk_stat),.rot_count(rot_count));
    
    increment_angle_counter_7seg increment_angle_counter_7seg(.clk50(clk50),.rot_clk(rot_clk),.sys_init_ctrl(sys_init_ctrl),.rot_en(rot_en),.bcdint(bcdint));
    
    mux_7seg mux_7seg(.clk50(clk50),.sys_init_ctrl(sys_init_ctrl),.khertz_clk(khertz_clk),.bcdint(bcdint),.digit(digit),.seg(seg));
    
    led_counter led_counter(.clk50(clk50),.sys_init_ctrl(sys_init_ctrl),.hertz_clk(hertz_clk),.led(led));
    assign rst = pb[3]; 
    assign sys_init = pb[2]; 
    assign trg = pb[1];
    assign rot_clk = (rot_en & stp_clk); 
    assign adc_trg = ~(adc_en & khertz_clk); 
    assign debug = wrk_stat;
    
//    always @(posedge clk50) begin
////        rst <= pb[3]; sys_init <= pb[2]; trg <= pb[1];
//        rot_clk <= (rot_en & stp_clk); adc_trg <= ~(adc_en & khertz_clk); debug <= wrk_stat;
//    end
endmodule
