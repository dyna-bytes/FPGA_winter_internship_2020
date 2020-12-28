`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 18:40:54
// Design Name: 
// Module Name: flipflop_4bit_bus_tb
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


module flipflop_4bit_bus_tb();

    reg clk, reset, en;
    reg [3:0] d;
    wire [3:0] q, qbar;
    
    parameter clk_period = 10;
    
    flipflop_4bit_bus ff(.clk(clk), .reset(reset), .en(en), .d(d), .q(q), .qbar(qbar));
    
    always begin
      clk = 1; reset = 0; en = 1;
      forever #(clk_period / 2) clk = ~clk;
      forever #(clk_period * 20) en = ~en;
      forever #(clk_period * 10) reset = ~reset;
    end

    
    initial begin
        d = 4'h0; #3;
        d = 4'h3; #(clk_period * 2);
        d = 4'h7; #(clk_period * 3);
        d = 4'hE; #(clk_period * 3);
        d = 4'hA; #(clk_period * 2);
    end
    
endmodule
