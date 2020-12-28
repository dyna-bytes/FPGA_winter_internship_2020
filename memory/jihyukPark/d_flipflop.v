`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 17:23:37
// Design Name: 
// Module Name: d_flipflop
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


module d_flipflop(
    input d, clk,
    output q, qbar
    );
    
    wire net, void;
    
    dlatch dlatch1(.clk(~clk), .d(d), .q(net), .qbar(void));
    dlatch dlatch2(.clk(clk), .d(net), .q(q), .qbar(qbar));

endmodule
