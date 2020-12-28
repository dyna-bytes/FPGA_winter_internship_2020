`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 17:16:01
// Design Name: 
// Module Name: d_flipflop_tb
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


module d_flipflop_tb();

    reg clk, d;
    wire q, qbar;
    
    //d_flipflop dff(.clk(clk), .d(d), .q(q), .qbar(qbar));
    d_flipflop_opt dff_opt(.clk(clk), .d(d), .q(q), .qbar(qbar));
    
    initial begin
        clk = 0; d = 0;
        #1000 $stop;
    end
    
    always begin
            #5 clk = ~clk;           
    end
    
    always begin
            #13 d = ~d;           
    end

endmodule
