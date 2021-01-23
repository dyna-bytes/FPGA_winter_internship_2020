`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/21 15:19:27
// Design Name: 
// Module Name: mycmb_ctrl_tb
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


module mycmb_ctrl_tb();
    reg clk50; 
    reg [3:0] pb; 
    reg [7:0] sw;
    wire debug, rot_clk, adc_trg;
    wire stp_clk;
    wire [3:0] digit, rf_sw;
    wire [7:0] led, seg;
    wire [9:0] rot_count;

    mycmb_ctrl u_mycmb_ctrl(.clk50(clk50),.pb(pb),.sw(sw),.debug(debug),.rot_clk(rot_clk),.adc_trg(adc_trg)
        ,.stp_clk(stp_clk),.digit(digit),.rf_sw(rf_sw),.led(led),.seg(seg),.rot_count(rot_count));

    parameter step = 20;
    always begin
        clk50 = 0;
        forever #(step/2) clk50 = ~clk50;
    end
    
    initial begin
        pb <= 4'b0000; sw <= 8'b0000_0000;
        #10 pb[3] <= 0;
        # (step*10) pb[3] <= 1;
        # (step*20) pb[3] <= 0;
        
        #2000 pb[2] <= 0;
        # (step*10) pb[2] <= 1;
        # (step*30) pb[2] <= 0;
        
        #8000 pb[1] <= 0;
        # (step*10) pb[1] <= 1;
        # (step*30) pb[1] <= 0;
    end
endmodule
