`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 15:35:36
// Design Name: 
// Module Name: srlatch_tb
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


module srlatch_tb();
    reg reset, set;
    wire q, qbar;
     
    srlatch SR(.r(reset), .s(set), .q(q), .qbar(qbar));
  
    initial begin
        reset = 0;
        set = 1;
        #1000 $stop;
    end
  
    always begin
        forever begin
            #10 set = ~set;
   	        #5 reset = ~reset;
            $display("tick : %0d, set : %b, reset : %b, q : %b, qbar : %b", $time, set, reset, q, qbar);
       //%d displays using a fixed width to accommodate the largest possible value for the expression being displayed. 
       //%0d displays the minimum width, suppressing any leading 0's or spaced.
        end
    end
endmodule
