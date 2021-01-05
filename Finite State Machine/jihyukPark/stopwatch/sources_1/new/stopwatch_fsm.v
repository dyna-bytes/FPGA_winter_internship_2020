`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/31 15:57:11
// Design Name: 
// Module Name: stopwatch_fsm
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


module stopwatch_fsm(
    input clk, reset, start, stop,
    output [1:0] en
    );
    
reg [1:0] state, next_state;

parameter T0 = 2'b00;   //base
parameter T1 = 2'b01;   //countup
parameter T2 = 2'b10;   //stop

//state register
always @(posedge clk or negedge reset)
    if(!reset) state <= T0;
    else state <= next_state;

//button noise fillter
//parameter filter_width = 5;
//reg [filter_width:0] shifter;
//reg filtered;
//always @ (posedge clk or negedge reset) begin
//  if(!reset)
//    shifter <= 0; 
//  else if (shifter[filter_width:1] == 0)
//    filtered <= 0;
//  else if (shifter[filter_width:1] == 1) 
//    filtered <= 1;

//  shifter <= { shifter[filter_width-1:0], start };
//end
    
//next state logic
always @(state or start or stop) begin
    if(stop) next_state = T0;
    else
        case(state)
          T0 : if(~start) next_state = T0;//T1;
               else       next_state = T1;//T0;
          T1 : if(~start) next_state = T1;//T2;
               else       next_state = T2;//T1;
          T2 : if(~start) next_state = T2;//T1;
               else       next_state = T1;//T2;
          default :       next_state = T0;//T0;
        endcase
 end       
 
  //output logic
  assign en = state;
//  always @(state)
//    case(state)
//        T1 :      en = T1;    //sec_counter.v starts counting up
//        T2 :      en = T2;    //sec_counter.v pauses
//        default : en = T0;    //sec_counter.v is not enable
//    endcase
    
           
endmodule
