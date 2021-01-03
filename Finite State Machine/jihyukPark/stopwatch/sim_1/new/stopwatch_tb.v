`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/31 17:36:14
// Design Name: 
// Module Name: stopwatch_tb
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


module stopwatch_tb();

reg clk, reset;
reg start, stop;

wire [3:0] d, e, f, g, h, i;
wire [7:0] seg;
wire [5:0] seg_sel;

top top(clk, reset, start, stop,    d, e, f, g, h, i, seg,seg_sel);

parameter clk_period = 10;

initial begin
    reset = 0;
    #13 reset = 1;
    #(clk_period) reset = 0;
end

always begin
    clk = 0;
    forever #(clk_period/2) clk = ~clk;
end

initial begin
    start = 0; stop = 0;
    #(clk_period*3) start = 1;
    #(clk_period) start = 0;
      //  #300 $stop;
//    #750 stop = 1;
//    #(clk_period) stop = 0;
end

/*
wire [7:0] ges = {seg[0], seg[1], seg[2], seg[3], seg[4], seg[5], seg[6], seg[7]}; //ges is transpose of seg
    always @(seg) begin    
      $display("Time : %0d, seg_sel : %d",$time, seg_sel);
      case(ges)
        8'b1111_1100 : $display("d is 0, seg_sel is %d\n", seg_sel);
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
    end*/
endmodule
