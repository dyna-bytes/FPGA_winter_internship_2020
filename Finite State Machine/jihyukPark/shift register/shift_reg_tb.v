`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 18:46:57
// Design Name: 
// Module Name: shift_reg_tb
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


module shift_reg_tb();
    reg clk, reset, load, sin;
    reg [3:0] D;
    wire [3:0] Q;
    wire sout;
    
    shift_reg U0(.clk(clk), .reset(reset), .load(load), .sin(sin), .D(D), .Q(Q), .sout(sout));
  //  shift_reg_ver2 U0(.clk(clk), .reset(reset), .load(load), .sin(sin), .D(D), .Q(Q), .sout(sout));
    parameter clk_period = 10;

//    always begin
//        clk = 1'b1;
//        forever #(clk_period/2) clk = ~clk;
//    end
//    initial begin
//        sin = 1'h0; //4'b0000; 
//        D[0] = 1'hF;//4'b1111;
//        D[1] = 1'hE; // 4'b1110;
//        D[2] = 1'hD;//4'b1101;
//        D[3] = 1'hC;//4'b1100;
////        #(clk_period*2) reset = 0;
////        #(clk_period*2.5) reset = 1;
//        reset = 1;
//        #10 reset = 0;
//    end
//    always begin    
//       if( sin <= 4'b1011 )
//        #10 sin  = sin + 1'h1;//4'b0001;
//       else
//        #10 sin  = 1'h0; //4'b0000;     
//    end 
//    always begin
//        load = 1;
//        forever #(clk_period*10) load = ~load;
//    end    
    
    
    initial clk = 0;
    always clk = #(clk_period/2) ~clk;
    
    initial begin
        reset = 1; #13  //test serial to serial transfrom
        reset = 0; #(500 - 13)
        reset = 1; #13  //test serial to parallel transform
        reset = 0; #(500 - 13)
        reset = 1; #13  //test parallel to serial transfrom
        reset = 0; //#(500 - 13) $stop;
    end
    
    initial sin = 0;
    always begin
        forever begin
            #(clk_period) sin = 1;
            #(clk_period) sin = 0; 
            #(clk_period) sin = 0;
            #(clk_period) sin = 1;
        end
    end
    
    initial load = 0;
    always begin
        #500 load = 1;
    end
    
    always begin
        #(clk_period * 4) D = 4'b1010;
        #(clk_period * 4) D = 4'b1001;
        #(clk_period * 4) D = 4'b0110;
        #(clk_period * 4) D = 4'b1011;
    end

endmodule

