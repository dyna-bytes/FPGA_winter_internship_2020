`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/20 13:32:00
// Design Name: 
// Module Name: CMB_top
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


module CMB_top(
    input        clk100_in,
    input[2:0]   pb_in,
    input[3:0]   sw_in,
    output[3:0]  led_out,
    output[3:0]  rf_sw_out,
    output       debug_out,
    output[9:0]  rot_count_out,
    output       rot_clk_out,
    output       stp_clk_out,
    output       adc_trg_out,
    output       scl,
    output       sda
    );
    
    wire rst;
    wire sys_init;
    wire trg;
    
    wire clk_25MHz;
    wire clk_1MHz;
    wire clk_1KHz;
    wire stp_clk;
    wire clk_1Hz;
    
    wire sys_init_ctrl;
    wire trg_ctrl;
    
    wire wrk_stat;
    wire rot_en;
    wire adc_en;
    
    wire [15:0] bcd_int;
    assign rst      = pb_in[2];
    assign sys_init = pb_in[1];
    assign trg      = pb_in[0];
    
    assign debug_out = wrk_stat;
    assign rot_clk = rot_en & stp_clk;
    assign adc_trg_out = ~(adc_en & clk_1KHz);
    
    assign rot_clk_out = rot_clk;
    assign stp_clk_out = stp_clk;
    
    clk_cntr_top   
    U0      (.fpga_clk(clk100_in), .rst(rst), 
            .clk_25MHz(clk_25MHz), .clk_1MHz(clk_1MHz), .clk_1KHz(clk_1KHz), .clk_100Hz(stp_clk), .clk_1Hz(clk_1Hz));
         
    button_edge_trigger     
    U1_1    (.i_clk(clk_1MHz), .button(sys_init), 
             .button_edge(sys_init_ctrl));
    
    button_edge_trigger
    U1_2    (.i_clk(clk_1MHz), .button(trg), 
             .button_edge(trg_ctrl));
    
    FSM
    U2      (.fpga_clk(clk100_in), .stp_clk(stp_clk), .sys_init_ctrl(sys_init_ctrl), .trg_ctrl(trg_ctrl), .sw(sw_in),
             .wrk_stat(wrk_stat), .rot_en(rot_en), .adc_en(adc_en), .rf_sw(rf_sw_out), .rot_count(rot_count_out));
             
    increment_angle_counter_for_7seg
    U3      (.sys_init_ctrl(sys_init_ctrl), .fpga_clk(clk100_in), .rot_clk(rot_clk), .rot_en(rot_en),
             .bcd_int(bcd_int));         

    tm1637_external_connect
    U4      (.clk25(clk_25MHz), .data(bcd_int), .scl(scl), .sda(sda));

    LED8_counter
    U5      (.sys_init_ctrl(sys_init_ctrl), .fpga_clk(clk100_in), .clk_1Hz(clk_1Hz), 
             .led(led_out),
             .sys_init(sys_init), .trg(trg), .rot_en(rot_en), .wrk_stat(wrk_stat));
             
             
endmodule
