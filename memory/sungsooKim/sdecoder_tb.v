`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/30 14:58:01
// Design Name: 
// Module Name: sdecoder_tb
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


module sdecoder_tb();
    reg [3:0] D;
    wire a,b,c,d,e,f,g,dp;
    sdecoder u_sd(.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.dp(dp),.D(D));
//    wire [7:0] seg;
//    sdecoder u_sd(.seg(seg),.D(D));
    
    initial begin
        D = 4'b0000;
        #100 $stop;
    end
    always begin    
       if( D <= 4'b1111 )
        #4 D  = D + 4'b0001;
       else
        #4 D  = 4'b0000;     
    end  
/*
    always @(seg) begin
        $display("Time : %0d, segment : %b", $time, seg);
        case(seg)
        8'b1111_1100 : $display("d is 0\n");
        8'b0110_0000 : $display("d is 1\n");
        8'b1101_1010 : $display("d is 2\n");
        8'b1111_0010 : $display("d is 3\n");
        8'b0110_0110 : $display("d is 4\n");
        8'b1011_0110 : $display("d is 5\n");
        8'b1011_1110 : $display("d is 6\n");
        8'b1110_0000 : $display("d is 7\n");
        8'b1111_1110 : $display("d is 8\n");
        8'b1111_0110 : $display("d is 9\n");
        8'b1110_1111 : $display("d is a\n");
        8'b0011_1111 : $display("d is b\n");
        8'b1001_1101 : $display("d is c\n");
        8'b0111_1011 : $display("d is d\n");
        8'b1001_1111 : $display("d is e\n");
        8'b1000_1111 : $display("d is f\n");
        default : $display("the output is not the value of 7 segment\n");
      endcase
    end
*/
endmodule
