`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/20 17:05:53
// Design Name: 
// Module Name: increment_angle_counter_7seg
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


module increment_angle_counter_7seg(
    input clk50, rot_clk, sys_init_ctrl, rot_en,
    output [15:0] bcdint
    );
    
    reg [3:0] cnt1, cnt2, cnt3, cnt4;
    parameter [3:0] cnt_1 = 4'b0001;
    
    assign bcdint = {cnt4, cnt3, cnt2, cnt1};
    
    always @(posedge clk50) begin
        if (sys_init_ctrl == 1) begin
//            bcdint <= 16'b0000_0000_0000_0000;
            cnt1 <= 4'b0000; cnt2 <= 4'b0000; cnt3 <= 4'b0000; cnt4 <= 4'b0000;
        end
        else;
    end
    
    always @(negedge rot_clk) begin
        if (sys_init_ctrl !== 1 & rot_en == 1) begin
            if (cnt1 == 4'b1001 & cnt2 !== 4'b1001 & cnt3 !== 4'b1001 & cnt4 !== 4'b1001) begin
                cnt1 <= 4'b0000; cnt2 <= cnt2 + cnt_1;
            end
            else if (cnt1 == 4'b1001 & cnt2 == 4'b1001 & cnt3 !== 4'b1001 & cnt4 !== 4'b1001) begin
                cnt1 <= 4'b0000; cnt2 <= 4'b0000; cnt3 <= cnt3 + cnt_1;      
            end
            else if (cnt1 == 4'b1001 & cnt2 == 4'b1001 & cnt3 == 4'b1001 & cnt4 !== 4'b1001) begin
                cnt1 <= 4'b0000; cnt2 <= 4'b0000; cnt3 <= 4'b0000; cnt4 <= cnt4 + cnt_1;      
            end
            else if (cnt1 == 4'b1001 & cnt2 == 4'b1001 & cnt3 == 4'b1001 & cnt4 == 4'b1001) begin
                cnt1 <= 4'b0000; cnt2 <= 4'b0000; cnt3 <= 4'b0000; cnt4 <= 4'b0000;
            end
            else cnt1 <= cnt1 + cnt_1;
//            bcdint <= {cnt4, cnt3, cnt2, cnt1};
            end  
        else;  
    end
 
endmodule
