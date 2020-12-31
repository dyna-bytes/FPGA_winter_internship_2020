`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/30 15:13:58
// Design Name: 
// Module Name: seg_7_tb
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


module seg_7_tb();

    reg [3:0] d;
    wire [7:0] seg;
    
    seg_7 U0(.d(d), .seg(seg));
    
    initial d = 4'b0000;
    
    always begin
        if (d == 4'b1111)
            #10 d = 4'b0000;
        else
            #10 d = d + 4'b0001;
    end
    
    wire [7:0] ges = {seg[0], seg[1], seg[2], seg[3], seg[4], seg[5], seg[6], seg[7]}; //ges is transpose of seg
    always @(seg) begin
      $display("Time : %0d, segment : %b", $time, seg);
      case(ges)
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
        default : $display("Error : the output is not the value of 7 segment\n");
      endcase
    end
    
endmodule
