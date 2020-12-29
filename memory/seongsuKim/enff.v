`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 17:52:40
// Design Name: 
// Module Name: enff
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


module enff(
    input clk, d, en,
    output out, n, nbar,
    output q, qbar
    );
    
    mux u_mux(.a(d),.b(q),.sel(en),.out(out));
    flipflop u_ff(.clk(clk),.d(out),.n(n),.nbar(nbar),.q(q),.qbar(qbar));
endmodule
