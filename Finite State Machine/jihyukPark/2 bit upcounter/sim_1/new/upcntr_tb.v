`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 13:59:03
// Design Name: 
// Module Name: upcntr_tb
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


module upcntr_tb();
    reg clk, reset, trigger;
    wire [1:0] state;
    
    parameter clk_period = 10;
    
    upcntr up_counter(.clk(clk), .reset(reset), .trigger(trigger), .state(state));
    
    initial begin reset = 0;
               #13 reset = 1;
               #(clk_period) reset = 0;
    end
    
    always begin 
        clk = 1'b0;
        forever #(clk_period/2) clk = ~clk;
    end
    
    initial trigger = 1'b1;
    
   

endmodule
