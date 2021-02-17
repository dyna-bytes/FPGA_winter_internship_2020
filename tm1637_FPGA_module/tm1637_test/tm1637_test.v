`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/15 16:37:15
// Design Name: 
// Module Name: tm1637_test
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
module tm1637_test(
    input clk100_in,
    output led_out,
    output scl,
    output sda   
    );
    wire clk_25MHz, clk_1Hz;
    reg [15:0] data = 0;
    
    clk_cntr_top    U0  (.fpga_clk(clk100_in), .clk_25MHz(clk_25MHz), .clk_1Hz(clk_1Hz));
    tm1637_external_connect    U1  (.clk25(clk_25MHz), .data(data), .scl(scl), .sda(sda));
    
    assign led_out = clk_1Hz;
    
    // assign data[3:0] = 4'b0000;
    // assign data[7:4] = 4'b0001;
    // assign data[11:8] = 4'b0010;
    // assign data[15:12] = 4'b0011;
   always @(posedge clk_1Hz) begin
       if( data[3:0] == 9 && data[7:4] == 9 && data[11:8] == 9 && data[15:12] == 9) begin
           data[15:0] = 0;
       end
       else if( data[7:4] == 9 && data[11:8] == 9 && data[15:12] == 9) begin
           data[15:4] = 0;
           data[3:0] = data[3:0] + 1;
       end
       else if( data[11:8] == 9 && data[15:12] == 9) begin
           data[15:8] = 0;
           data[7:4] = data[7:4] + 1;
       end
       else if( data[15:12] == 9) begin
           data[15:12] = 0;
           data[11:8] = data[11:8] + 1;
       end
       else
           data[15:12] = data[15:12] + 1;
   end
    
endmodule
