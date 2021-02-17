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
    input fpga_clk,
    output clk_25MHz,
    output clk_1Hz   
    );
    
    parameter M = 10**6;    // Mega
    parameter K = 10**3;    // Kilo
    wire clk_1KHz;
    
    // Generation of 25MHz clock from 100MHz clock
    clock_counter          #(.from(100*M), .to(25*M)) 
    from_100MHz_to_25MHz    (.i_clk(fpga_clk), .o_clk(clk_25MHz));
       
    // Generation of 1KHz clock from 100MHz clock
    clock_counter          #(.from(100*M), .to(1*K)) 
    from_100MHz_to_1KHz     (.i_clk(fpga_clk), .o_clk(clk_1KHz));
        
    // Generation of 1Hz clock from 1KHz clock
    clock_counter          #(.from(1*K), .to(1)) 
    from_1KHz_to_1Hz      (.i_clk(clk_1KHz), .o_clk(clk_1Hz));
    
endmodule
