`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/15 16:13:25
// Design Name: 
// Module Name: obs
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


module obs(
    input clk50,sys_init_ctrl, stp_clk, trg_ctrl, 
    input [7:0] sw,
    output reg rot_en, wrk_stat, adc_en,
    output reg [3:0] rf_sw,
    output reg [9:0] rot_count
    );
    
    reg [7:0] prcs_count;
    
    always @(posedge clk50) begin         // initialization needs separation, run by clock with sufficiently small period
        if (trg_ctrl == 1) wrk_stat <= 1; // VHDL can separate initialization and working process with clk inside if statement
        else;                             // Verilog needs separate always statement with different clk
        
        if (sys_init_ctrl == 1) begin
            rot_en <= 0; adc_en <= 0; wrk_stat <= 0; rf_sw <= 4'b0000; 
            prcs_count <= 8'b0000_0000; rot_count <= 10'b00_0000_0000;
        end
        else;
    end
    always @(posedge stp_clk) begin                     
        if (sys_init_ctrl !== 1 & wrk_stat == 1) begin
            prcs_count <= prcs_count + 1;
            if (sw == 8'b0000_0000 & wrk_stat == 1) begin	
            case (prcs_count)                                           //  ms  
				8'b00000001 : rot_en <= 1;			               		//   1	 Stepping motor clock injection (moving 0.5 deg <= 5 clocks of 100Hz) 
				8'b00000110 : rot_en <= 0;                              //   6	 Reflector stable time == 1000ms 
				8'b01101010 : rf_sw <= 4'b0001;                            // 106   RF switch control (300K calibration source) 
				8'b01101101 : adc_en <= 1;                              // 109	 After 30ms, trigger for ADC board (300 clocks of 1kHz) 
				8'b10001011 : begin adc_en <= 0; rf_sw <= 4'b0010; end  // 139	 RF switch control (77K calibration source) 
				8'b10001110 : adc_en <= 1;	                            // 142	 After 30ms, trigger for ADC board (300 clocks of 1kHz) 
                8'b10101100 : begin adc_en <= 0; rf_sw <= 4'b0100; end  // 172	 RF switch control (4K calibration source) 
                8'b10101111 : adc_en <= 1;                              // 175	 After 30ms, trigger for ADC board (300 clocks of 1kHz) 
                8'b11001101 : begin adc_en <= 0; rf_sw <= 4'b1000; end  // 205	 RF switch control (Observation data) 
                8'b11010000 : adc_en <= 1;                              // 208   After 30ms, trigger for ADC board (300 clocks of 1kHz) 
                8'b11101110 : begin adc_en <= 0; rf_sw <= 4'b0000; prcs_count <= 10'b00_0000_0000; rot_count <= rot_count + 1; end
                // 238	1 point process complete and counting initialize, Rotation Count Information for DAQ Board 
			    default;
			    endcase
			end
            else if (sw == 8'b0000_0001 & wrk_stat == 1) begin
			case (prcs_count)
			    8'b0000_0001 : rot_en <= 1;                       //   1	// Stepping motor clock injection (moving 0.5 deg <= 5 clocks of 100Hz) //
                8'b0000_0110 : rot_en <= 0;                       //   6	// Reflector stable time == 1000ms //
                8'b0110_1010 : rf_sw <= 4'b0001;                    // 106	// RF switch control (300K calibration source) //
                8'b0110_1101 : adc_en <= 1;                       // 109	// After 30ms, trigger for ADC board (300 clocks of 1kHz) //
                8'b1000_1011 : begin adc_en <= 0; rf_sw <= 4'b1000; end    // 139	// RF switch control (Observation data) //
                8'b1000_1110 : adc_en <= 1;                       // 142	// After 30ms, trigger for ADC board (300 clocks of 1kHz) //
                8'b1010_1100 : begin adc_en <= 0; rf_sw <= 4'b0000; prcs_count <= 10'b00_0000_0000; rot_count <= rot_count + 1; end		
                // 172	// 1 point process complete and counting initialize //   // Rotation Count Information for DAQ Board //
                default;
                endcase
            end		
            else if (sw == 8'b00000010 & wrk_stat == 1) begin
			case (prcs_count) 
			    8'b00000001 : rot_en <= 1;                       //   1	// Stepping motor clock injection (moving 0.5 deg <= 5 clocks of 100Hz) //
                8'b00000110 : rot_en <= 0;                       //   6	// Reflector stable time == 1000ms //
                8'b01101010 : rf_sw <= 4'b0001;                    // 106	// RF switch control (77K calibration source) //
                8'b01101101 : adc_en <= 1;                       // 109	// After 30ms, trigger for ADC board (300 clocks of 1kHz) //
                8'b10001011 : begin adc_en <= 0; rf_sw <= 4'b1000; end     // 139	// RF switch control (Observation data) //
                8'b10001110 : adc_en <= 1;                       // 142	// After 30ms, trigger for ADC board (300 clocks of 1kHz) //
                8'b10101100 : begin adc_en <= 0; rf_sw <= 4'b0000; prcs_count <= 10'b00_0000_0000; rot_count <= rot_count + 1; end	
                // 172	// 1 point process complete and counting initialize //   // Rotation Count Information for DAQ Board //
                default;
                endcase
            end
            else if (sw == 8'b00000011 & wrk_stat == 1) begin
			case (prcs_count) 
			    8'b00000001 : rot_en <= 1;                       //   1	// Stepping motor clock injection (moving 0.5 deg <= 5 clocks of 100Hz) //
                8'b00000110 : rot_en <= 0;                       //   6	// Reflector stable time == 1000ms //
                8'b01101010 : rf_sw <= 4'b0001;                    // 106	// RF switch control (4K calibration source) //
                8'b01101101 : adc_en <= 1;                       // 109	// After 30ms, trigger for ADC board (300 clocks of 1kHz) //
                8'b10001011 : begin adc_en <= 0; rf_sw <= 4'b1000; end    // 139	// RF switch control (Observation data) //
                8'b10001110 : adc_en <= 1;                       // 142	// After 30ms, trigger for ADC board (300 clocks of 1kHz) //
                8'b10101100 : begin adc_en <= 0; rf_sw <= 4'b0000; prcs_count <= 10'b00_0000_0000; rot_count <= rot_count + 1; end		
                // 172	// 1 point process complete and counting initialize //   // Rotation Count Information for DAQ Board //
                default;
                endcase
			end
			else;	
		end
    
        if (rot_count == 10'b10_1101_0000) begin			// rot_count is total observation point (720 points at 0.5 deg resolution) --
			wrk_stat <= 0;
        end
        else; 
    end
endmodule
