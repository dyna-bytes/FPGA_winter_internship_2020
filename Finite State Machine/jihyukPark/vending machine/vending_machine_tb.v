`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/30 16:54:08
// Design Name: 
// Module Name: vending_machine_tb
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


module vending_machine_tb();

reg clk, reset;
reg c, f, p;
//reg COIN, COFFEE, SPRITE    ; //coin, coffee, sprite
wire [7:0] seg;

wire [1:0] led, out, money;
wire led_coffee = led[0], led_sprite = led[1], out_coffee = out[0], out_sprite = out[1];

vending_machine_ver2 U0(.clk(clk), .reset(reset), .C(c), .F(f), .P(p), .seg(seg), .led(led), .o(out), .state(money));

parameter clk_period = 10;
initial clk = 1'b0;
always clk = #(clk_period/2) ~clk;

initial begin
    reset = 1'b0;
    #3 reset = 1'b1;
    #(clk_period) reset = 1'b0;
end

initial begin
        c = 0; f = 0; p = 0;
    end
    initial begin
        #(clk_period*2) c = 0; f = 1; p = 0;
        #(clk_period) c = 0; f = 0; p = 1;   

        #(clk_period) c = 1; f = 0; p = 0;
        #(clk_period) c = 0; f = 1; p = 0;

        #(clk_period) c = 1; f = 0; p = 0;
        #(clk_period) c = 0; f = 0; p = 1;

        #(clk_period) c = 1; f = 0; p = 0;  
        #(clk_period) c = 0; f = 1; p = 0;
        #(clk_period) c = 0; f = 1; p = 0;

        #(clk_period) c = 1; f = 0; p = 0;  
        #(clk_period) c = 1; f = 0; p = 0;  
        #(clk_period) c = 0; f = 0; p = 1;

        #(clk_period) c = 1; f = 0; p = 0; 
        #(clk_period) c = 0; f = 1; p = 0;
        #(clk_period) c = 0; f = 1; p = 0;
        #(clk_period) c = 0; f = 1; p = 0;

        #(clk_period) c = 1; f = 0; p = 0; 
        #(clk_period) c = 1; f = 0; p = 0; 
        #(clk_period) c = 1; f = 0; p = 0; 
        #(clk_period) c = 0; f = 0; p = 1;
        #(clk_period) c = 1; f = 0; p = 0;
    end


always @(seg) begin
  $display("led coffee : %b, led sprite : %b\n  C : %d, F : %d, P : %d, \nout coffee : %b, out sprite : %b",
  led[0], led[1], c, f, p, out[0], out[1]);//, COIN, COFFEE, SPRITE, out[0], out[1]);
  $display("Time : %0d, segment : %b", $time, seg);
  case(seg)
    8'b0011_1111 : $display("d is 0\n");
    8'b0000_0110 : $display("d is 1\n");
    8'b0101_1011 : $display("d is 2\n");
    8'b0100_1111 : $display("d is 3\n");
    8'b0110_0110 : $display("d is 4\n");
    8'b0110_1101 : $display("d is 5\n");
    8'b0111_1101 : $display("d is 6\n");
    8'b0000_0111 : $display("d is 7\n");
    8'b0111_1111 : $display("d is 8\n");
    8'b0110_1111 : $display("d is 9\n");
    8'b1111_0111 : $display("d is a\n");
    8'b1111_1100 : $display("d is b\n");
    8'b1011_1001 : $display("d is c\n");
    8'b1101_1110 : $display("d is d\n"); 
    8'b1111_1001 : $display("d is e\n");
    8'b1111_0001 : $display("d is f\n");
    default : $display("Error : the output is not the value of 7 segment\n");
  endcase
end
endmodule
