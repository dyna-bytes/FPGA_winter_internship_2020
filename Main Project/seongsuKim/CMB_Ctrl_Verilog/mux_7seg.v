`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/20 17:18:43
// Design Name: 
// Module Name: mux_7seg
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


module mux_7seg(
    input clk50, sys_init_ctrl, khertz_clk, 
    input [15:0] bcdint,
    output reg [3:0] digit,
    output reg [7:0] seg
    );
    
    reg [2:0] dig_count;
    reg [3:0] bcdcrt;
    reg seg_dp;
    
    always @(posedge clk50) begin
        if (sys_init_ctrl == 1) begin
	        seg <= 8'b0000_0000;
		    digit <= 4'b0000;
		    dig_count <= 3'b000;
		    bcdcrt <= 4'b0000;
	        dig_count[2] <= 1;
	    end
	    else;
	end
	    
    always @(posedge khertz_clk) begin 
        if (sys_init_ctrl !== 1) dig_count[1:0] <= dig_count[1:0] + 2'b01;
	    else;
	    
	    case (dig_count[1:0])
            2'b00 : begin bcdcrt <= bcdint[3:0]; seg_dp <= 1; digit <= 4'b1110; end
            2'b01 : begin bcdcrt <= bcdint[7:4]; seg_dp <= 0; digit <= 4'b1101; end
            2'b10 : begin bcdcrt <= bcdint[11:8]; seg_dp <= 1; digit <= 4'b1011; end
		    2'b11 : begin bcdcrt <= bcdint[15:12]; seg_dp <= 1; digit <= 4'b0111; end
            default;
        endcase
	
	    if (dig_count[2] == 1) begin
		    case (bcdcrt)
			4'b0000 : seg <= {7'b0000001, seg_dp};
			4'b0001 : seg <= {7'b1001111, seg_dp};
			4'b0010 : seg <= {7'b0010010, seg_dp};
			4'b0011 : seg <= {7'b0000110, seg_dp};
			4'b0100 : seg <= {7'b1001100, seg_dp};
			4'b0101 : seg <= {7'b0100100, seg_dp};
			4'b0110 : seg <= {7'b0100000, seg_dp};
			4'b0111 : seg <= {7'b0001101, seg_dp};
			4'b1000 : seg <= {7'b0000000, seg_dp};
			4'b1001 : seg <= {7'b0000100, seg_dp};
			default;
	    endcase
	    end
	    else seg <= 8'b0000_0000;
    end
endmodule
