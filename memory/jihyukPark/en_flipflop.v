`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 17:50:12
// Design Name: 
// Module Name: en_flipflop
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


module en_flipflop(
    input en, clk, d,
    output q, qbar
    );
    wire net_d, q;
    
    mux_2to1 enable(.a(q), .b(d), .sel(en), .out(net_d));
    
    d_flipflop dff(.clk(clk), .d(net_d), .q(q), .qbar(qbar));
    
endmodule
