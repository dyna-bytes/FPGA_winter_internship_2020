`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/30 16:09:42
// Design Name: 
// Module Name: vendor
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


module vendor(
    input clk,reset, c, f, p,
    output [1:0] a,b,m, // a,b[1] is next state, a_i+1, b_i+1, a,b[0] is current state, a_1, b_i, 
    // m[1] is sprite, m[0] is coffee
    output reg [1:0] led, out //led,out[1] is sprite, led,out[0] is coffee
    );
    assign a[1] = ~a[0]&(b[0]&c) | a[0]&(~b[0]&~f | ~b[0]&c | b[0]&f | ~f&~p&b[0]);
    assign b[1] = ~a[0]&(~b[0]&c | b[0]&~c&~f) | a[0]&(~b[0]&c | b[0]&~f&~p | ~b[0]&f);
    ff u_ff1(.clk(clk),.reset(reset),.d(a[1]),.q(a[0]));
    ff u_ff2(.clk(clk),.reset(reset),.d(b[1]),.q(b[0]));
    assign m = {a[0],b[0]};
    
    parameter s0 = 2'b00;
    parameter s1 = 2'b01; 
    parameter s2 = 2'b11; 
    parameter s3 = 2'b10; 
    parameter on = 1'b1;
    parameter off = 1'b0;
    parameter can = 1'b1;
    parameter cann = 1'b0;
    
    always @(m) begin
        case(m)
        s0: begin
            led[1] = off; led[0] = off; out[1] = cann; out[0] = cann;
        end
        s1: begin
            led[1] = off; led[0] = on; out[1] = cann; out[0] = can;
        end
        s2: begin
            led[1] = off; led[0] = on; out[1] = cann; out[0] = can;   
        end
        s3: begin
            led[1] = on; led[0] = on; out[1] = can; out[0] = can;
        end
        endcase  
    end
endmodule
