`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 17:55:26
// Design Name: 
// Module Name: traffic_signal_ver2
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


module traffic_signal_ver2(
    input clk, reset, TA, TB,
    output reg [1:0] SA, SB
    );
    
    reg [1:0] state, next_state;
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b11;
    parameter S3 = 2'b10;
    
    parameter RED = 2'b00;
    parameter YELLOW = 2'b01;
    parameter GREEN = 2'b10;
    
    // status register
    always @ (posedge clk or posedge reset)
        if (reset) state <= S0;
        else state <= next_state;
        
    // next state logic
    always @ (state or TA or TB) begin
        case (state)
            S0 : if(~TA) next_state = S1;
                 else next_state = S0;
            S1 : next_state = S2;
            S2 : if(~TB) next_state = S3;
                 else next_state = S2;
            S3 : next_state = S0;
            default : next_state = S0;
        endcase
     end    
     
     // output logic
     always @ (state) begin
        if (state == S0) begin
            SA = GREEN;
            SB = RED;
         end
         if (state == S1) begin
            SA = YELLOW;
            SB = RED;
         end
         if (state == S2) begin
            SA = RED;
            SB = GREEN;
         end
         if (state == S3) begin
            SA = RED;
            SB = YELLOW;
         end
     end
         
    
endmodule
