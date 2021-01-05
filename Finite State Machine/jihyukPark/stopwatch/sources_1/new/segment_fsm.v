`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/31 13:30:50
// Design Name: 
// Module Name: fsm
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


module segment_fsm( clk, reset, d, e, f, g, h, i, count, data, seg_sel);
parameter N = 10;
input clk, reset;
input [3:0] d, e, f, g, h, i;
input [N-1 : 0] count;
output reg [3:0] data;
output reg [5:0] seg_sel;

reg [2:0] state, next_state;
parameter S0 = 3'b000;  //state parameters
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;
parameter S5 = 3'b101;

parameter adjustment_factor_for_tb = 1;
parameter trg = 10'b11_1111_1111/adjustment_factor_for_tb; //trigger

//status register
always @(posedge clk or negedge reset)
    if(!reset) state <= S0;
    else state <= next_state;
    
//next state logic
always @(state or count) begin
//    next_state  = (count < trg) ? state : ( (state == S5) ? S0 : state + 1 );
    if(count < trg) 
        next_state <= state;
    else
        case(state)
            S5 : next_state <= S0;
            default : next_state <= state + 1'b1;
        endcase
end

//output logic
always @(state , d, e, f, g, h, i) begin
    seg_sel <= 6'b10_0000 / (2 ** state);
    case(state)
        S0 : data = d;
        S1 : data = e;
        S2 : data = f;
        S3 : data = g;
        S4 : data = h;
        S5 : data = i;
        default : data = d;
    endcase    
end

//32  0   1
//16  1   2
//8   2   4
//4   3   8 
//2   4   16
//1   5   32

endmodule
