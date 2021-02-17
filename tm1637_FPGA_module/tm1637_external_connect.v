`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//-- reference : https://github.com/mongoq/tm1637-fpga --
//-- translated from German to English --
//-- converted from VHDL to Verilog HDL --
// Company: Korea Univ.
// Engineer: JIHYUK PARK
// 
// Create Date: 2021/02/15 15:14:00
// Design Name: 
// Module Name: tm1637_external_connect
// Project Name: CMB_ctrl_Verilog_Spartan7
// Target Devices: Spartan7 CSGA324
// Tool Versions: Vivado 2020.2
// Description: External connect module of 7 segment for Spartan7
// 
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tm1637_external_connect
    #(
        parameter integer divider = 2500
    )(
        input       clk25,
        input[15:0] data,
        output reg  scl,
        output reg  sda
    );
    
    function int_to_seg7(input integer site, input integer bit_num, 
                        input[3:0] in_digit0, input[3:0] in_digit1, input[3:0] in_digit2, input[3:0] in_digit3);
        reg [7:0] seg7;
        reg [3:0] dig;
    begin
        case (site)
            1 : dig = in_digit0;
            2 : dig = in_digit1;
            3 : dig = in_digit2;
            4 : dig = in_digit3;
        endcase

       //   --      0(a)
       //  |  |  5(f)   1(b)
       //   --      6(g)
       //  |  |  4(e)   2(c)
       //   --      3(d)

        case (dig)   // use only 7 bits. MSB is redundant, so keep it 0.
            4'b0000 : seg7 = 8'b00111111;    //  0
            4'b0001 : seg7 = 8'b00000110;    //  1
            4'b0010 : seg7 = 8'b01011011;    //  2
            4'b0011 : seg7 = 8'b01001111;    //  3
            4'b0100 : seg7 = 8'b01100110;    //  4
            4'b0101 : seg7 = 8'b01101101;    //  5
            4'b0110 : seg7 = 8'b01111101;    //  6
            4'b0111 : seg7 = 8'b00000111;    //  7
            4'b1000 : seg7 = 8'b01111111;    //  8
            4'b1001 : seg7 = 8'b01101111;    //  9
            4'b1010 : seg7 = 8'b01110111;    //  A
            4'b1011 : seg7 = 8'b01111100;    //  b
            4'b1100 : seg7 = 8'b00111001;    //  C
            4'b1101 : seg7 = 8'b01011110;    //  d
            4'b1110 : seg7 = 8'b01111001;    //  E
            4'b1111 : seg7 = 8'b01110001;    //  F
            default : seg7 = 8'b00000000;    //  8
        endcase
   
        int_to_seg7 = seg7[bit_num];    
    end
    endfunction
    
    integer clkdiv = 0;
    reg clk_en = 0;
    reg [31:0] state_counter = 0;
    reg rdy = 0;
    
    reg [3:0] reg_digit0 = 2;
    reg [3:0] reg_digit1 = 0;
    reg [3:0] reg_digit2 = 2;
    reg [3:0] reg_digit3 = 1;
    
    //  clock dividing process
    always @(posedge clk25) begin
        if (clkdiv < divider - 1) begin
            clkdiv <= clkdiv + 1;
            clk_en <= 0;
        end
        else begin
            clkdiv <= 0;
            clk_en <= 1;
        end
    end

    //  data inserting process
    always @(posedge clk25) begin
        if (rdy && clk_en) begin
            reg_digit0 <= data[3:0];
            reg_digit1 <= data[7:4];
            reg_digit2 <= data[11:8];
            reg_digit3 <= data[15:12];
        end
    end
    
    // state generating process
    always @(posedge clk25) begin
        if (clk_en) begin
            case (state_counter)
                0 : begin scl <= 1; sda <= 1; end
                1 : begin scl <= 1; sda <= 1; end //  start condition
                2 :                 sda <= 0;
                3 : scl <= 0; //  command 1
                4 : scl <= 1;
                5 : begin scl <= 0; sda <= 0; end
                6 : scl <= 1; 
                7 : scl <= 0; 
                8 : scl <= 1;
                9 : scl <= 0; 
                10: scl <= 1; 
                11: scl <= 0; 
                12: scl <= 1; 
                13: scl <= 0; 
                14: scl <= 1; 
                15: begin scl <= 0;  sda <= 1; end
                16: scl <= 1; 
                17: begin scl <= 0;  sda <= 0; end
                18: scl <= 1; 
                19: begin scl <= 0; sda <= 1'bz; end
                20: scl <= 1;
                21: begin scl <= 0; sda <= 0; end //  stop condition
                22: scl <= 1;
                23:                 sda <= 1;     //  start condition
                24: begin scl <= 1; sda <= 0; end //  command 2
                25: begin scl <= 0; sda <= 0; end
                26: scl <= 1; 
                27: scl <= 0; 
                28: scl <= 1; 
                29: begin scl <= 0; sda <= 0; end
                30: begin scl <= 1; sda <= 0; end
                31: begin scl <= 0; sda <= 0; end
                32: begin scl <= 1; sda <= 0; end
                33: begin scl <= 0; sda <= 0; end 
                34: begin scl <= 1; sda <= 0; end
                35: begin scl <= 0; sda <= 0; end
                36: begin scl <= 1; sda <= 0; end
                37: begin scl <= 0; sda <= 1; end
                38: begin scl <= 1; sda <= 1; end
                39: begin scl <= 0; sda <= 1; end
                40: begin scl <= 1; sda <= 1; end
                41: begin scl <= 0; sda <= 1'bz; end
                42: scl <= 1;
                
                //  Data 1 to 58
                
                43 : begin scl <= 0; sda <= int_to_seg7(1, 0, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                44 : begin scl <= 1;                                                                           end
                45 : begin scl <= 0; sda <= int_to_seg7(1, 1, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                46 : begin scl <= 1;                                                                           end
                47 : begin scl <= 0; sda <= int_to_seg7(1, 2, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end 
                48 : begin scl <= 1;                                                                           end
                49 : begin scl <= 0; sda <= int_to_seg7(1, 3, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end 
                50 : begin scl <= 1;                                                                           end
                51 : begin scl <= 0; sda <= int_to_seg7(1, 4, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end 
                52 : begin scl <= 1;                                                                           end
                53 : begin scl <= 0; sda <= int_to_seg7(1, 5, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end 
                54 : begin scl <= 1;                                                                           end
                55 : begin scl <= 0; sda <= int_to_seg7(1, 6, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end 
                56 : begin scl <= 1;                                                                           end
                57 : begin scl <= 0; sda <= int_to_seg7(1, 7, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end 
                58 : begin scl <= 1;                                                                           end
                
                //  Data 1 to here
                
                59 : begin scl <= 0; sda <= 1'bz; end
                60 : begin scl <= 1;              end
                
                //  Data 2 61 to 76	  
                
                61 : begin scl <= 0; sda <= int_to_seg7(2, 0, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                62 : begin scl <= 1;                                                                           end
                63 : begin scl <= 0; sda <= int_to_seg7(2, 1, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                64 : begin scl <= 1;                                                                           end
                65 : begin scl <= 0; sda <= int_to_seg7(2, 2, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                66 : begin scl <= 1;                                                                           end
                67 : begin scl <= 0; sda <= int_to_seg7(2, 3, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                68 : begin scl <= 1;                                                                           end
                69 : begin scl <= 0; sda <= int_to_seg7(2, 4, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                70 : begin scl <= 1;                                                                           end
                71 : begin scl <= 0; sda <= int_to_seg7(2, 5, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end 
                72 : begin scl <= 1;                                                                           end
                73 : begin scl <= 0; sda <= int_to_seg7(2, 6, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                74 : begin scl <= 1;                                                                           end
                75 : begin scl <= 0; sda <= int_to_seg7(2, 7, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                76 : begin scl <= 1;                                                                           end
                
                //  Data 2 to here
                
                77 : begin scl <= 0; sda <= 1'bz; end
                78 : begin scl <= 1;              end
                
                //  Data 3 79 to 94	  
                79 : begin scl <= 0; sda <= int_to_seg7(3, 0, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                80 : begin scl <= 1;                                                                           end
                81 : begin scl <= 0; sda <= int_to_seg7(3, 1, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                82 : begin scl <= 1;                                                                           end
                83 : begin scl <= 0; sda <= int_to_seg7(3, 2, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                84 : begin scl <= 1;                                                                           end
                85 : begin scl <= 0; sda <= int_to_seg7(3, 3, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                86 : begin scl <= 1;                                                                           end
                87 : begin scl <= 0; sda <= int_to_seg7(3, 4, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                88 : begin scl <= 1;                                                                           end
                89 : begin scl <= 0; sda <= int_to_seg7(3, 5, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                90 : begin scl <= 1;                                                                           end
                91 : begin scl <= 0; sda <= int_to_seg7(3, 6, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                92 : begin scl <= 1;                                                                           end
                93 : begin scl <= 0; sda <= int_to_seg7(3, 7, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                94 : begin scl <= 1;                                                                           end
                
                //  Data 3 to here
                
                95 : begin scl <= 0; sda <= 1'bz; end
                96 : begin scl <= 1;              end
                
                //  Data 4 97 to 112
                
                97  : begin scl <= 0; sda <= int_to_seg7(4, 0, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                98  : begin scl <= 1;                                                                           end
                99  : begin scl <= 0; sda <= int_to_seg7(4, 1, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                100 : begin scl <= 1;                                                                           end
                101 : begin scl <= 0; sda <= int_to_seg7(4, 2, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                102 : begin scl <= 1;                                                                           end
                103 : begin scl <= 0; sda <= int_to_seg7(4, 3, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                104 : begin scl <= 1;                                                                           end
                105 : begin scl <= 0; sda <= int_to_seg7(4, 4, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                106 : begin scl <= 1;                                                                           end
                107 : begin scl <= 0; sda <= int_to_seg7(4, 5, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                108 : begin scl <= 1;                                                                           end
                109 : begin scl <= 0; sda <= int_to_seg7(4, 6, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                110 : begin scl <= 1;                                                                           end
                111 : begin scl <= 0; sda <= int_to_seg7(4, 7, reg_digit0, reg_digit1, reg_digit2, reg_digit3); end
                112 : begin scl <= 1;                                                                           end                         
                
                //  Data 4 to here
                
                113 : begin scl <= 0; sda <= 1'bz; end
                114 : begin scl <= 1;              end
                115 : begin scl <= 0; sda <= 0;    end
                116 : begin scl <= 1;              end
                117 : begin scl <= 1; sda <= 1;    end // Command 3
                118 : begin scl <= 1; sda <= 0;    end
                119 : begin scl <= 0; sda <= 1;    end
                120 : begin scl <= 1;              end
                121 : begin scl <= 0;              end
                122 : begin scl <= 1;              end
                123 : begin scl <= 0;              end
                124 : begin scl <= 1;              end
                125 : begin scl <= 0;              end
                126 : begin scl <= 1;              end
                127 : begin scl <= 0; sda <= 0;    end
                128 : begin scl <= 1;              end
                129 : begin scl <= 0;              end
                130 : begin scl <= 1;              end
                131 : begin scl <= 0;              end
                132 : begin scl <= 1;              end
                133 : begin scl <= 0; sda <= 1;    end
                134 : begin scl <= 1;              end
                135 : begin scl <= 0; sda <= 1'bz; end
                136 : begin scl <= 1; sda <= 1'bz; end
                137 : begin scl <= 0; sda <= 0;    end
                138 : begin scl <= 1; sda <= 0;    end
                139 : begin scl <= 1; sda <= 1;    end
                140 : begin scl <= 1; sda <= 1;    end
                141 : begin scl <= 1; sda <= 1;    end 
            endcase    
            
            if (state_counter == 10000) state_counter <= 0;
            else                        state_counter <= state_counter + 1;
            
            if (state_counter == 9999)  rdy <= 1;
            else                        rdy <= 0;
            
        end
    end
    
endmodule
