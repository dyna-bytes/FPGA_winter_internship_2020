`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 17:59:25
// Design Name: 
// Module Name: enff_tb
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


module enff_tb();
    reg clk, d, en;
    wire out, n,nbar,q,qbar;
    
    enff u_enff(.clk(clk),.d(d),.en(en),.out(out),.n(n),.nbar(nbar),.q(q),.qbar(qbar));
    
    initial begin
        clk = 0; d = 0; en = 0;
        #100 $stop;
    end
    
    always begin
        #5 clk = ~clk;
    end
    
    always begin
        #10 d = ~d;
    end
    
    always begin
        #20 en = ~en;
    end
endmodule
