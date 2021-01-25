`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/20 13:59:49
// Design Name: 
// Module Name: FSM
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


module FSM(
    input        stp_clk,
    input        sys_init_ctrl,
    input        trg_ctrl,
    input[7:0]   sw,
    
    output reg      wrk_stat = 0,
    output reg      rot_en = 0,
    output reg      adc_en = 0,
    output reg [3:0]  rf_sw = 0,
    output reg [9:0]  rot_count = 0
    );
    
    reg[7:0] prcs_count = 0;
    
    always @( trg_ctrl, sys_init_ctrl, rot_count, prcs_count) begin
    //    ------ Work State Control ------
        if (trg_ctrl) wrk_stat <= 1;
        
    //    ------ System Initialiazation Process ------
        if (sys_init_ctrl) begin
            wrk_stat <= 0;
            rot_en <= 0;
            adc_en <= 0;
            rf_sw <= 0;
            prcs_count <= 0;
            rot_count <= 0;
        end
        
    //    ------ Counted Rotation Checker -------            
        if (rot_count == 720) wrk_stat <= 0;
     end
     
     always @(posedge stp_clk) begin
    //    ------ Process Counter (State Logic & Register) ------   
        if (wrk_stat) begin
            prcs_count <= prcs_count + 1;            
            case (prcs_count)
                1 : rot_en <= 1;
                6 : rot_en <= 0;
                
                106 : if (sw == 0)     rf_sw <= 4'b0001;
                      else if(sw == 1) rf_sw <= 4'b0001;
                      else if(sw == 2) rf_sw <= 4'b0010;
                      else if(sw == 3) rf_sw <= 4'b0100;
                      
                109 : adc_en <= 1;
                
                139 : begin 
                        adc_en <= 0;
                        if (sw == 0)     rf_sw <= 4'b0010;
                        else if(sw == 1) rf_sw <= 4'b1000;
                        else if(sw == 2) rf_sw <= 4'b1000;
                        else if(sw == 3) rf_sw <= 4'b1000;    
                      end 
                      
                142 : adc_en <= 1;
                
                172 : begin 
                        adc_en <= 0;
                        if (sw == 0)     rf_sw <= 4'b0100;
                        else begin       
                                         rf_sw <= 4'b0000;
                                         prcs_count <= 0;
                                         rot_count <= rot_count + 1;         
                        end
                      end 
                      
                 175 : adc_en <= 1;
                 
                 205 : begin
                        adc_en <= 0;
                        rf_sw <= 4'b1000;
                       end
                 
                 208 : adc_en <= 1;
                 
                 238 : begin
                        adc_en <= 0;
                        rf_sw <= 4'b0000;
                        prcs_count <= 0;
                        rot_count <= rot_count + 1;
                       end
            endcase
        end
    end
    
    
    
endmodule
