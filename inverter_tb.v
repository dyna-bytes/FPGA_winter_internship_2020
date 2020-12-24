`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/23 13:52:19
// Design Name: 
// Module Name: inverter_tb
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


module inverter_tb(
    );
    reg a;
    wire y;
    
    inverter u_inv(
    .a (a),
    .y (y));
    
    initial a=1'b0;
    
    always a = #100 ~a;
    initial begin
        #1000
        $finish;
    end
endmodule
