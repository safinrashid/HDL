`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2022 04:21:17 PM
// Design Name: 
// Module Name: display_timer
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


module display_timer(
    input [6:0] digit0,
    input [6:0] digit1,
    input [6:0] digit2,
    input [6:0] digit3,
    input display_clk,
    output reg [6:0] sseg,
    output reg [3:0] an,
    output reg dp
    
    );
    
    reg [1:0] timer_state;
    reg[1:0] timer_next_state;
    
    always@(posedge display_clk) begin
    timer_state <= timer_next_state;
    end
    
    
    initial begin 
        timer_next_state = 2'b00;
        timer_state = 2'b00;
        end
        
    always@(*) begin
    
    case(timer_state) 
        2'b00: timer_next_state = 2'b01;
        2'b01: timer_next_state = 2'b10;
        2'b10: timer_next_state = 2'b11;
        2'b11: timer_next_state = 2'b00;
        endcase
        end
    
    always@(*) begin
        
        case(timer_state)
            2'b00 : begin sseg = digit0; 
                    an = 4'b1110;
                    dp = 1'b1;
                    end
            2'b01 : begin sseg = digit1;
                    an = 4'b1101;
                    dp = 1'b1;
                    end
            2'b10 : begin sseg = digit2;
                    an = 4'b1011;
                    dp = 1'b0;
                    end
            2'b11 : begin sseg = digit3;
                    an = 4'b0111;
                    dp = 1'b1;
                    end
        endcase
        
        
        
        end
endmodule
