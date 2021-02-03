`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/20 18:32:06
// Design Name: 
// Module Name: LED8_counter
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


module LED8_counter(
    input sys_init_ctrl,
    input fpga_clk,
    input clk_1Hz,
    output reg [7:0] led
    );
    
	 wire clk_1Hz_signal;
	 button_edge_trigger pos_edge_clk_1Hz
	 (.i_clk(fpga_clk), .button(clk_1Hz), .button_edge(clk_1Hz_signal));
	 
    always @(posedge fpga_clk) begin
		 //if(fpga_clk)
			if (sys_init_ctrl)
					led <= 0;
		 
		 if(clk_1Hz_signal)
			 if(! sys_init_ctrl) begin
					led <= led + 1;            
					if (led == 8'b1111_1111)
						 led <= 0;
			  end
    end
    
endmodule
