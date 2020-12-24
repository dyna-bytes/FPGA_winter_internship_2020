`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/24 18:50:23
// Design Name: 
// Module Name: fulladder_tb
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


module fulladder_tb();

    reg a, b, cin;
    wire sum, cout;
    
    fulladder u_fulladder(a, b, cin, sum, cout);
    
    initial begin
        a = 0; b = 0; cin = 0;
        #80 $stop;
    end
    
    always begin
       #4 a = 0;
       #4 a = 1;
    end 
  
    always begin
       #2 b = 0;
       #2 b = 1;
    end
    
    always begin
       #1 cin = 0;
       #1 cin = 1;
    end
  
endmodule
