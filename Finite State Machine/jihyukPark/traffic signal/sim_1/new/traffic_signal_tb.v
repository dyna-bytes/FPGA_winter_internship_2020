`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 17:42:30
// Design Name: 
// Module Name: traffic_signal_tb
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


module traffic_signal_tb();
    reg clk, reset;
    reg TA, TB;
    wire [1:0] SA, SB;
    
    parameter clk_period = 10;
    initial clk = 1'b0;
    always clk = #(clk_period/2) ~clk;
    traffic_signal U0(.clk(clk), .reset(reset), .TA(TA), .TB(TB), .SA(SA), .SB(SB));
    //traffic_signal_ver2 U0(.clk(clk), .reset(reset), .TA(TA), .TB(TB), .SA(SA), .SB(SB));
    
    initial begin
        reset = 0;
        #13 reset = 1;
        #(clk_period) reset = 0;
     end
     
     initial begin
        TA = 0; TB = 0; #3
        TA = 0; TB = 1; #(clk_period)   
        TA = 1; TB = 0; #(clk_period) 
        TA = 1; TB = 1; #(clk_period) 
        TA = 0; TB = 0;
     end
    

endmodule
