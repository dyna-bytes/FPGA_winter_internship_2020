`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/20 17:16:31
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
    input sys_init_ctrl,
    input fpga_clk,
    input clk_1KHz,
    input [15:0] bcd_int,
    
    output reg [3:0] digit = 0,
    output reg [7:0] seg = 0
    );
    
    reg [1:0] digit_select;
    reg triggered = 0;
    reg [3:0] bcd_char = 0;
    reg seg_dp = 0;
    
    always @(sys_init_ctrl) begin
    // system initialization
        if (sys_init_ctrl) begin
           init_reg(seg, 1'b1); // just do seg <= {8{1'b1}}.......
           init_reg(digit, 1'b1);
           init_reg(digit_select, 1'b0);
           init_reg(bcd_char, 1'b0);
           triggered <= 1;
        end
     end
     
     always @(posedge clk_1KHz) begin
     // counting up digits by 1KHz clock
        if (! sys_init_ctrl) 
            digit_select[1:0] <= digit_select[1:0] + 2'b01;
//     end
     
////--------------------------------------------------------------------        
//     always @(posedge clk_1KHz) begin       
     // digit selection
        case (digit_select)
            0 : begin
                bcd_char <= bcd_int[3:0];
                seg_dp <= 1;
                digit <= 14;
            end
            1 : begin
                bcd_char <= bcd_int[7:4];
                seg_dp <= 0;
                digit <= 13;
            end
            2 : begin
                bcd_char <= bcd_int[11:8];
                seg_dp <= 1;
                digit <= 11;
            end
            3 : begin
                bcd_char <= bcd_int[15:12];
                seg_dp <= 1;
                digit <= 7;
            end
        endcase   
        
    // mapping bcd charater to segment
        if (triggered)    
            case (bcd_char)
                4'b0000 : seg <= {7'b000_0001, seg_dp};
                4'b0001 : seg <= {7'b100_1111, seg_dp};
                4'b0010 : seg <= {7'b001_0010, seg_dp};
                4'b0011 : seg <= {7'b000_0110, seg_dp};
                4'b0100 : seg <= {7'b100_1100, seg_dp};
                4'b0101 : seg <= {7'b010_0100, seg_dp};
                4'b0110 : seg <= {7'b010_0000, seg_dp};
                4'b0111 : seg <= {7'b000_1101, seg_dp};
                4'b1000 : seg <= {7'b000_0000, seg_dp};
                default : seg <= {7'b000_0100, seg_dp};
            endcase
        else
            init_reg(seg, 1'b1);
    end
    
    
//--------------------------------------------------------------------    
    parameter WIDTH = 32;
    task init_reg(output [WIDTH:0] register, input init_val);
    integer i;
    begin
        for(i = 0;  (i != WIDTH) || (register[i] != 1'bx);  i = i + 1)  //ascending order
            register[i] <= init_val;
    end
    endtask
    
endmodule
