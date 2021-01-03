`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/31 16:33:24
// Design Name: 
// Module Name: sec_counter
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


module sec_counter(
    input clk, reset,
    input [1:0] en,
    output reg [18:0] sec_count //19 bit counter
    );
    
    parameter T0 = 2'b00;   //sec_counter.v is not enable 
    parameter T1 = 2'b01;   //sec_counter.v starts counting up             
    parameter T2 = 2'b10;   //sec_counter.v pauses      
    
    parameter sec = 19'd499_999;
    parameter adjustment_factor_for_tb = 400_000;
    
    always @ (posedge clk or posedge reset)
        if(reset || (sec_count >= sec/adjustment_factor_for_tb)) sec_count <= 0; //sec_count >= sec 라고 쓰면 d에 0이 출력되는 시간이 짧아짐. why?
        else 
            case(en)
                T0 : sec_count <= 0;
                T1 : sec_count <= sec_count + 1'b1;
                T2 : sec_count <= sec_count;
                default : sec_count <= 0;
            endcase
    
endmodule
