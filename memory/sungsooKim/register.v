`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 18:56:29
// Design Name: 
// Module Name: register
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


module register(
    input clk, d, en,
    output out, n, nbar,
    output q, qbar
    );
    
    enff u_enff(.clk(clk),.d(out),.n(n),.nbar(nbar),.q(q),.qbar(qbar))
    clk, d, en,
    output out, n, nbar,
    output q, qbar
    mux u_mux(.a(d),.b(q),.sel(en),.out(out));
    flipflop u_ff();
endmodule
