`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/20 13:37:43
// Design Name: 
// Module Name: button_edge_trigger
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


module button_edge_trigger#(
    parameter is_positive = 1
    )(
    input i_clk,
    input button,
    output reg button_edge
    );
    
    reg button_buffer = 0;
    
// mode 1
//-----------------------------------------------------------------  
//    always @(posedge i_clk)
//    begin       
//        if (is_positive == 1)
//            button_edge <= button & (~button_buffer);
//        else
//            button_edge <= (~button) & button_buffer;
            
//        button_buffer <= button;    
//    end
//-----------------------------------------------------------------    


// mode 2    
//-----------------------------------------------------------------
    always @(posedge i_clk)
        button_buffer <= button;
    
    always @(button) 
        if (is_positive == 1)
            button_edge <= button & (~button_buffer);
        else
            button_edge <= (~button) & button_buffer;
            
endmodule
