`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/31 00:05:56
// Design Name: 
// Module Name: vending_machine_ver2
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


module vending_machine_ver2(
     input clk, reset,             
     input C, F, P, 
     output [7:0] seg,             
     output reg [1:0] led, o, 
     output [1:0] state
    );
    
    wire A, B, An, Bn;
    wire [1:0] next_state;
    assign state = {A,B};
    assign next_state = {An, Bn};
    
    dff dff1(.clk(clk), .reset(reset), .d(An), .q(A));
    dff dff2(.clk(clk), .reset(reset), .d(Bn), .q(B));
 
    
 
    assign An = ~A&(B&C) |  A&(~B&~F | ~B&C | B&F | ~F&~P&B);    
    assign Bn = ~A&(~B&C | B&~C&~F ) | A&(~B&C | B&~F&~P | ~B&F);

    
    parameter IDLE = 2'b00;
    parameter S1 = 2'b01; 
    parameter S2 = 2'b10; 
    parameter S3 = 2'b11; 
     
    seg_7 segment(.d({2'b00,state}), .seg(seg));
     
    always @(state) begin                           
        case(state)                                 
            IDLE : begin led[0] = 0; led[1] = 0; end
            S1   : begin led[0] = 1; led[1] = 0; end
            S2   : begin led[0] = 1; led[1] = 0; end
            S3   : begin led[0] = 1; led[1] = 1; end
        endcase                                     
    end                                             
    
    always @(next_state) begin       
        if(state == S1 && next_state == IDLE) begin       
            o[0] = 1; o[1] = 0;                           
            end                                           
        else if(state == S2 && next_state == S1) begin    
            o[0] = 1; o[1] = 0;                           
            end                                           
        else if(state == S3 && next_state == S2) begin    
            o[0] = 1; o[1] = 0;                           
            end                                           
        else if(state == S3 && next_state == IDLE) begin  
            o[0] = 0; o[1] = 1;                           
            end                                           
        else begin                                        
            o[0] = 0; o[1] = 0;                           
        end                                               
    end                                                   
                                                          
endmodule
