`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/30 16:30:40
// Design Name: 
// Module Name: vending_machine
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


module vending_machine(
    input clk, reset,
    input C, F, P,  //coin = 1 \, coffee = 1 \, sprite = 3 \
    output [7:0] seg,
    output reg [1:0] led, o, state
    );
    
    reg [1:0] next_state;
    wire A = state[1], B = state[0], An = next_state[1], Bn = next_state[0];

    parameter IDLE = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;
    
    
    // status register
    always @ (posedge clk or posedge reset) begin
        if(reset)
            state <= IDLE;
        else begin
            state <= {An, Bn}; //next_state = 
        end
    end

    //next state logic                                             
    assign An = ~A&(B&C) |  A&(~B&~F | ~B&C | B&F | ~F&~P&B);    
    assign Bn = ~A&(~B&C | B&~C&~F ) | A&(~B&C | B&~F&~P | ~B&F);    
 
//    always @(posedge clk or posedge reset or C or F or P) begin
//        next_state[1] = ~A&(B&C) |  A&(~B&~F | ~B&C | B&F | ~F&~P&B);
//        next_state[0] = ~A&(~B&C | B&~C&~F ) | A&(~B&C | B&~F&~P | ~B&F);
//    end
    

    //output logic
    //print coin
    seg_7 segment(.d({2'b00,state}), .seg(seg)); 
    
    //print led
    always @(state or next_state) begin 
        case(state)
            IDLE : begin led[0] = 0; led[1] = 0; end
            S1   : begin led[0] = 1; led[1] = 0; end
            S2   : begin led[0] = 1; led[1] = 0; end
            S3   : begin led[0] = 1; led[1] = 1; end
        endcase
    end
    
    //print out coffee and out sprite
//    always @(posedge clk or posedge reset) begin
//        if({A, B} == S1 && {An, Bn} == IDLE)
//            o[0] = 1;
//        else if({A, B} == S2 && {An, Bn} == S1)
//            o[0] = 1;
//        else if({A, B} == S3 && {An, Bn} == S2)
//            o[0] = 1;
//        else if({A, B} == S3 && {An, Bn} == IDLE)
//            o[1] = 1;
//        else begin
//            o[0] = 0; o[1] = 0;
//        end          
//    end
       always @(state) begin
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
