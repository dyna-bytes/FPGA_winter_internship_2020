`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/06 13:11:42
// Design Name: 
// Module Name: clk_cntr_top
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


module clk_cntr_top(
    input fpga_clk, reset,
    output o_clk
    );
    
    parameter M = 10**6;    // Mega
    parameter K = 10**3;    // Kilo
    
    wire i_clk_100MHz = fpga_clk;
    wire o_clk_1MHz;
    wire o_clk_1KHz;
    wire o_clk_100Hz;
    wire o_clk_1Hz = o_clk;
    
    // Generation of 1MHz clock from 100MHz clock
    clock_counter          #(.from(100*M), .to(1*M)) 
    from_100MHz_to_1MHz    (.i_clk(i_clk_100MHz), .reset(reset), .o_clk(o_clk_1MHz));
    
    // Generation of 1KHz clock from 1MHz clock
    clock_counter          #(.from(1*M), .to(1*K)) 
    from_1MHz_to_1KHz     (.i_clk(o_clk_1MHz), .reset(reset), .o_clk(o_clk_1KHz));
    
    // Generation of 100Hz clock from 1KHz clock
    clock_counter          #(.from(1*K), .to(100)) 
    from_1KHz_to_100Hz     (.i_clk(o_clk_1KHz), .reset(reset), .o_clk(o_clk_100Hz));
    
    // Generation of 1Hz clock from 100Hz clock
    clock_counter          #(.from(100), .to(1)) 
    from_100Hz_to_1Hz      (.i_clk(o_clk_100Hz), .reset(reset), .o_clk(o_clk_1Hz));
    
endmodule
