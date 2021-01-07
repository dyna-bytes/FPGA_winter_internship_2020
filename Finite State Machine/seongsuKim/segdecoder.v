`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 12:17:43
// Design Name: 
// Module Name: segdecoder
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


module segdecoder(
    input [3:0] data,
    output reg [6:0] seg
    );
    
    always @(data) begin
        case(data)
            0: seg = 7'b111_1110;
            1: seg = 7'b011_0000;
            2: seg = 7'b110_1101;
            3: seg = 7'b111_1001;
            4: seg = 7'b011_0011;
            5: seg = 7'b101_1011;
            6: seg = 7'b101_1111;
            7: seg = 7'b111_0000;
            8: seg = 7'b111_1111;
            9: seg = 7'b111_1011;
            default: seg = 7'b000_0000;
        endcase
    end    
endmodule
