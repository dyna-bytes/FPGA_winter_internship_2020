`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/20 18:53:43
// Design Name: 
// Module Name: tb_CMB_top
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


module tb_CMB_top();

reg clk50_in;
reg [2:0] pb_in = 0;
reg [7:0] sw_in = 0;

wire [3:0] digit_out;
wire [7:0] led_out;
wire [7:0] seg_out;
wire [3:0] rf_sw_out;
wire debug_out;
wire [9:0] rot_count_out;
wire rot_clk_out;
wire stp_clk_out;
wire adc_trg_out;

CMB_top 
uut     (.clk50_in(clk50_in), .pb_in(pb_in), .sw_in(sw_in),
         .digit_out(digit_out), .led_out(led_out), .seg_out(seg_out), .rf_sw_out(rf_sw_out),
         .debug_out(debug_out), .rot_count_out(rot_count_out), .rot_clk_out(rot_clk_out),
         .stp_clk_out(stp_clk_out), .adc_trg_out(adc_trg_out));
         
parameter step = 20;

initial clk50_in = 1'b0;
always clk50_in = #(step/2) ~clk50_in;

initial begin
    pb_in[2] = 1;
    #(step*10) pb_in[2] = 0;
    #(step*20) pb_in[2] = 1;
    
    #2000
    pb_in[1] = 0;
    #(step*10) pb_in[1] = 1;
    #(step*30) pb_in[1] = 0;
    
    #8000
    pb_in[0] = 0;
    #(step*10) pb_in[0] = 1;
    #(step*30) pb_in[0] = 0;

end         

endmodule
