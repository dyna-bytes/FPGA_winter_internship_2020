`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 21:29:19
// Design Name: 
// Module Name: register_tb
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


module register_tb();
    reg clk, reset;
    reg [7:0] d;
    wire [7:0] q;
    
   register u_reg(clk,reset,d,q);
    
    parameter clk_period = 10;
    
    always begin
        clk = 1;
        forever #(clk_period/2) clk = ~clk;
    end

    always begin    
       if( d <= 8'b1111_1111)
        #2 d  = d + 8'b0000_0001;
       else
        #2 d  = 8'b0000_0000;     
    end 
    /*
    always begin 
        reset = 0;
        forever #(clk_period*4) reset = ~reset;
    end
    */
endmodule
