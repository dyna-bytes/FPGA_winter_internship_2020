`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 17:59:40
// Design Name: 
// Module Name: en_flipflop_tb
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


module en_flipflop_tb();

    reg clk, d, en;
    wire q, qbar;
    
   // en_flipflop en_ff(.en(en), .clk(clk), .d(d), .q(q), .qbar(qbar));
   en_flipflop_opt en_ff(.en(en), .clk(clk), .d(d), .q(q), .qbar(qbar));
   initial begin
        clk = 0; d = 0; en = 1;
        #1000 $stop;
    end
    
    always begin
            #5 clk = ~clk;           
    end
    
    always begin
            #13 d = ~d;           
    end

    always begin
            #250 en = ~en;           
    end
endmodule
