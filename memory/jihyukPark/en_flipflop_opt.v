`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 18:18:03
// Design Name: 
// Module Name: en_flipflop_opt
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


module en_flipflop_opt(
    input clk, d, en,
    output reg q, qbar
    );
    

    always @ (posedge clk) begin
        q = en ? d : q;
        qbar = ~q;
    end

    
       /* same code with above
    always @ (posedge clk) begin
        if(en) q <= d;    //using q reg
        else; //storing last data in q, by making ratch
        qbar <= ~q;      
    end
        */
    
endmodule
