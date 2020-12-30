`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 15:20:43
// Design Name: 
// Module Name: twobitupb
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


module twobitupb(
    input clk, reset,
    output [1:0] c
    );
    
    reg [1:0] state, nstate;
    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;
    parameter s3 = 2'b11;
    
    always @(posedge clk, posedge reset) begin
        if (reset) state <= s0;
        else state <= nstate;
    end
    
    always @(state) begin
        case (state)
        s0: nstate = s1;
        s1: nstate = s2;
        s2: nstate = s3;
        s3: nstate = s0;
        endcase
    end
    
    assign c = state;  
endmodule
