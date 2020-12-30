`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 18:13:36
// Design Name: 
// Module Name: trafficlightb
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


module trafficlightb(
    input clk, reset, ta,tb,
    output reg [1:0] sa,sb
    );
    
    reg [1:0] state, nstate;
    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;
    parameter s3 = 2'b11;
    
    parameter r = 2'b00;
    parameter y = 2'b01;
    parameter g = 2'b10;
    
    always @(posedge clk, posedge reset) begin
        if (reset) state <= s0;
        else state <= nstate;
    end
    
    always @(state, ta,tb) begin
        case (state)
        s0: if(~ta) nstate = s1;
            else nstate =s0;
        s1: nstate = s2;
        s2: if(~ta) nstate = s3;
            else nstate =s2; 
        s3: nstate = s0;
        default: nstate = s0;
        endcase
    end
    
    always @(state) begin
        if (state==s0) begin
            sa = g;
            sb = r;
        end
        if (state==s1) begin
            sa = y;
            sb = r;
        end        
        if (state==s2) begin
            sa = r;
            sb = g;
        end    
        if (state==s0) begin
            sa = r;
            sb = y;
        end   
    end
endmodule
