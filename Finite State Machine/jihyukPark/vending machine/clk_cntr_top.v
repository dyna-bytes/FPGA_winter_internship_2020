`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/06 14:00:51
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
    wire o_clk_1KHz = o_clk;
    
    // Generation of 1MHz clock from 100MHz clock
    clock_counter          #(.from(100*M), .to(1*M)) 
    from_100MHz_to_1MHz    (.i_clk(i_clk_100MHz), .reset(reset), .o_clk(o_clk_1MHz));
    
    // Generation of 1KHz clock from 1MHz clock
    clock_counter          #(.from(1*M), .to(1*K)) 
    from_1MHz_to_1KHz     (.i_clk(o_clk_1MHz), .reset(reset), .o_clk(o_clk_1KHz));
    
endmodule