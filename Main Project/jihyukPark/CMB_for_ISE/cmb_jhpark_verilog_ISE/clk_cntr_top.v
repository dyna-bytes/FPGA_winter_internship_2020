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
    input fpga_clk, rst,
    output clk_1MHz,  
    output clk_1KHz,  
    output clk_100Hz, 
    output clk_1Hz   
    );
    
    parameter M = 10**6;    // Mega
    parameter K = 10**3;    // Kilo
       
    // Generation of 1MHz clock from 100MHz clock
    clock_counter          #(.from(50*M), .to(1*M)) 
    from_50MHz_to_1MHz    (.i_clk(fpga_clk), .rst(rst), .o_clk(clk_1MHz));
    
    // Generation of 1KHz clock from 1MHz clock
    clock_counter          #(.from(50*M), .to(1*K)) 
    from_50MHz_to_1KHz     (.i_clk(fpga_clk), .rst(rst), .o_clk(clk_1KHz));
    
    // Generation of 100Hz clock from 1KHz clock
    // Using 100Hz clock as Stepping Motor Clock
    clock_counter          #(.from(1*K), .to(100), .reverse_clk(1)) 
    from_1KHz_to_100Hz     (.i_clk(clk_1KHz), .rst(rst), .o_clk(clk_100Hz));
        
    // Generation of 1Hz clock from 100Hz clock
    clock_counter          #(.from(1*K), .to(1)) 
    from_1KHz_to_1Hz      (.i_clk(clk_1KHz), .rst(rst), .o_clk(clk_1Hz));
    
endmodule
