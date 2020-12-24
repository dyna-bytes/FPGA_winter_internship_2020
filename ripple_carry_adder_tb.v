`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/24 19:08:51
// Design Name: 
// Module Name: ripple_carry_adder_tb
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


module ripple_carry_adder_tb();

    reg [3:0]A, B;
    wire [3:0]S;
    wire C;
    
    ripple_carry_adder rca(A, B, S, C);
    
    initial begin
        A = 4'b0000; B = 4'b0000;
        #80 $stop;
    end
    
    always begin    
       if( A <= 4'b1111 )
        #4 A  = A + 4'b0001;
       else
        #4 A  = 4'b0000;     
    end 
  
    always begin
       if( B <= 4'b1111 )
        #2 B  = B + 4'b0001;
       else
        #2 B  = 4'b0000;  
    end
 
endmodule
