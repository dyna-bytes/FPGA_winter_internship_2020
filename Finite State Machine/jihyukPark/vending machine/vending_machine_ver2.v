`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/31 00:05:56
// Design Name: 
// Module Name: vending_machine_ver2
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


module vending_machine_ver2(
     input clock, reset,             
     input C, F, P, 
     output [7:0] seg,             
     output seg_sel,
     output reg [1:0] led, o, 
     output [1:0] state
    );
    
    assign seg_sel = 6'b000_001;
    
    // Generation of 1KHz clock from 100MHz clock
    wire clk;
    clk_cntr_top clock_counter(.fpga_clk(clock), .reset(reset), .o_clk(clk));
    
    // State Varialbles and Parameters
    wire A, B, An, Bn;
    wire [1:0] next_state;
    assign state = {A,B};
    assign next_state = {An, Bn};
    
    // Status Register
    dff dff1(.clk(clk), .reset(reset), .d(An), .q(A));
    dff dff2(.clk(clk), .reset(reset), .d(Bn), .q(B));
 
    // Button Buffer
    wire c, f, p;   
    button_edge_trigger #(.pos_edge(0), .neg_edge(1))    neg_edge_trigger1 (.clk(clk), .button(C), .out(c));
    button_edge_trigger #(.pos_edge(0), .neg_edge(1))    neg_edge_trigger2 (.clk(clk), .button(P), .out(p));
    button_edge_trigger #(.pos_edge(0), .neg_edge(1))    neg_edge_trigger3 (.clk(clk), .button(F), .out(f));

    // Next State Logic
    assign An = ~A&(B&c) |  A&(~B&~f | ~B&c | B&f | ~f&~p&B);    
    assign Bn = ~A&(~B&c | B&~c&~f ) | A&(~B&c | B&~f&~p | ~B&f);


    // Output Logic
    parameter IDLE = 2'b00;
    parameter S1 = 2'b01; 
    parameter S2 = 2'b10; 
    parameter S3 = 2'b11; 
     
    seg_7 segment(.d({2'b00,state}), .seg(seg));
     
    always @(posedge clk) begin                           
        case(state)                                 
            IDLE : begin led[0] = 0; led[1] = 0; end
            S1   : begin led[0] = 1; led[1] = 0; end
            S2   : begin led[0] = 1; led[1] = 0; end
            S3   : begin led[0] = 1; led[1] = 1; end
        endcase                                     
    end                                             
    
    always @(posedge clk) begin       
        if(state == S1 && next_state == IDLE) begin       
            o[0] = 1; o[1] = 0;                           
            end                                           
        else if(state == S2 && next_state == S1) begin    
            o[0] = 1; o[1] = 0;                           
            end                                           
        else if(state == S3 && next_state == S2) begin    
            o[0] = 1; o[1] = 0;                           
            end                                           
        else if(state == S3 && next_state == IDLE) begin  
            o[0] = 0; o[1] = 1;                           
            end                                           
        else begin                                        
            o[0] = 0; o[1] = 0;                           
        end                                               
    end                                                   
                                                          
endmodule
