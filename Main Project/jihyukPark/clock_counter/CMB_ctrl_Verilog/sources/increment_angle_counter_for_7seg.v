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
    output  [15:0] bcd_int
    );
    
    reg [3:0] digit [3:0];
    assign     bcd_int = {digit[3], digit[2], digit[1], digit[0]};
    
        always @(posedge fpga_clk) 
            if (sys_init_ctrl) init_digit(3, 0);
            
        always @(negedge rot_clk) begin
        if (rot_en && !sys_init_ctrl) begin
            if ((digit[3] == 9) && (digit[2] == 9) && (digit[1] == 9) && (digit[0] == 9)) 
                init_digit(3, 0);
            else if ((digit[2] == 9) && (digit[1] == 9) && (digit[0] == 9)) begin
                init_digit(2, 0); 
                digit[3] <= digit[3] + 1;
            end
            else if ((digit[1] == 9) && (digit[0] == 9)) begin
                init_digit(1, 0);
                digit[2] <= digit[2] + 1;
            end
            else if (digit[0] == 9) begin
                init_digit(0, 0);
                digit[1] <= digit[1] + 1;
            end
            else
                digit[0] <= digit[0] + 1;
        end
        
    end
    
//-----------------------------------------------------
    // task using Global Variable Array "digit"
    task init_digit(input integer from, input integer to);
    integer i;
    begin
        for(i = from;  i >= to;  i = i - 1)
            digit[i] <= 4'b0000;
    end
    endtask
endmodule
