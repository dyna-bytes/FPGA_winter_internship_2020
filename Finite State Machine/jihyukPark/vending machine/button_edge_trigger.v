`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/06 14:11:06
// Design Name: 
// Module Name: button_edge_trigger
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


module button_edge_trigger #(
    parameter pos_edge = 0, neg_edge = 1,
    parameter filter_width = 100   // filter width is better to be multiples of 4
    )(
    input clk, button,
    output out
    );
   
// Button Noise Fillter
reg [filter_width : 0] shifter;
reg filtered;
wire [filter_width : filter_width/2] TRUE;                    // filter_width>>1 == filter_width/2
assign TRUE = { (filter_width - filter_width/2 + 1) {1'b1} }; // All bits are filled with 1s.

always @ (posedge clk) begin
    case({pos_edge, neg_edge})
        // neg_edge trigger
        01 : if ((shifter[filter_width : filter_width/2] == TRUE) && (shifter[filter_width/2 - 1 : 0] == 0))  
                 filtered <= 1;                                                                               
             else                                                                                             
                 filtered <= 0;     
       
        // pos_edge trigger
        10 : if ((shifter[filter_width : filter_width/2] == 0) && (shifter[filter_width/2 - 1 : 0] == TRUE))  
                 filtered <= 1;                                                                               
             else                                                                                             
                 filtered <= 0;            
        
        // both edges                                                                 
        11 : if ((shifter[filter_width : filter_width*3/4] == TRUE) && (shifter[filter_width*3/4 - 1 : filter_width/4] == 0) && (shifter[filter_width/4 - 1 : 0] == TRUE))  
                 filtered <= 1;                                                                                                                                             
             else                                                                                                                                                           
                 filtered <= 0;   
        default : filtered <= 0;                                                                                                                                             
    endcase
        
    // right shifting the register 'shifter'
    shifter <= { shifter[filter_width-1 : 0], button };
end        

assign out = filtered;    
    
endmodule
