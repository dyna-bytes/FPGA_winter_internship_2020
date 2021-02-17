`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/20 15:51:00
// Design Name: 
// Module Name: increment_angle_counter_for_7seg
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


module increment_angle_counter_for_7seg(
    input             sys_init_ctrl,
    input             fpga_clk,
    input             rot_clk,
    input             rot_en,
    output     [15:0] bcd_int
    );

    reg [3:0] 	digit [3:0];
    assign		bcd_int = {digit[0], digit[1], digit[2], digit[3]};
	wire 		negedge_rot_clk;
	parameter 	TRUE = 1;
    parameter 	FALSE = 0;

    button_edge_trigger			#(.is_positive(FALSE))
	get_neg_edge_from_rot_clk	(.i_clk(fpga_clk), .button(rot_clk), .button_edge(negedge_rot_clk));
	 
        always @(posedge fpga_clk) begin
			if (sys_init_ctrl)begin
				digit[3] <= 4'b0000;
				digit[2] <= 4'b0000;
				digit[1] <= 4'b0000;
				digit[0] <= 4'b0000;
			end
			
			else if(negedge_rot_clk) begin
				if (rot_en && !sys_init_ctrl) begin
						if ((digit[3] == 9) && (digit[2] == 9) && (digit[1] == 9) && (digit[0] == 9)) begin
							digit[3] <= 4'b0000;
							digit[2] <= 4'b0000;
							digit[1] <= 4'b0000;
							digit[0] <= 4'b0000;
						end		  
						else if ((digit[2] == 9) && (digit[1] == 9) && (digit[0] == 9)) begin
							digit[2] <= 4'b0000;
							digit[1] <= 4'b0000;
							digit[0] <= 4'b0000;
							digit[3] <= digit[3] + 1;
						end
						else if ((digit[1] == 9) && (digit[0] == 9)) begin
							digit[1] <= 4'b0000;
							digit[0] <= 4'b0000;
							digit[2] <= digit[2] + 1;
						end
						else if (digit[0] == 9) begin
							digit[0] <= 4'b0000;
							digit[1] <= digit[1] + 1;
						end
						else
							digit[0] <= digit[0] + 1;
				        end
				end
    end
endmodule
