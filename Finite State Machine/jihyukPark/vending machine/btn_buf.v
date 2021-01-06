`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/05 18:34:02
// Design Name: 
// Module Name: btn_buf
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

module btn_buf(
    input clk, btn,
    output out
    );
   
// Button Noise Fillter
parameter filter_width = 100;   // filter width should be even number
reg [filter_width : 0] shifter;
reg filtered;
wire [filter_width : filter_width/2] TRUE;
assign TRUE = { (filter_width - filter_width/2 + 1) {1'b1} }; // All bits are filled with 1s.

always @ (posedge clk) begin
    if ((shifter[filter_width : filter_width/2] == TRUE) && (shifter[filter_width/2 - 1 : 0] == 0))
        filtered <= 1;
    else
        filtered <= 0;
  shifter <= { shifter[filter_width-1 : 0], btn };
end        

assign out = filtered;    
    
endmodule
