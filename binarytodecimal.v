`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2022 10:40:45 AM
// Design Name: 
// Module Name: binarytodecimal
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


module binarytodecimal(
    input [15:0] count, 
    output reg [6:0] digit0,
    output reg [6:0] digit1,
    output reg [6:0] digit2,
    output reg [6:0] digit3
    );
    
    reg [3:0] mydigit0;
    reg [3:0] mydigit1;
    reg [3:0] mydigit2;
    reg [3:0] mydigit3;
    
   
    
    always@(count)
        begin
        
        
        
        mydigit0 = count%10;
        mydigit1 = (count%100-count%10)/10;
        mydigit2 = (count%1000-count%100)/100;
        mydigit3 = (count%10000)/1000;
        
          case(mydigit0)
            4'b0000 : digit0 = 7'b0000001;
            4'b0001 : digit0 = 7'b1001111;
            4'b0010 : digit0 = 7'b0010010;
            4'b0011 : digit0 = 7'b0000110;
            4'b0100 : digit0 = 7'b1001100;
            4'b0101 : digit0 = 7'b0100100;
            4'b0110 : digit0 = 7'b0100000;
            4'b0111 : digit0 = 7'b0001111;
            4'b1000 : digit0 = 7'b0000000;
            4'b1001 : digit0 = 7'b0000100;
            4'b1010 : digit0 = 7'b0001000;
            4'b1011 : digit0 = 7'b1100000;
            4'b1100 : digit0 = 7'b0110001;
            4'b1101 : digit0 = 7'b1000010;
            4'b1110 : digit0 = 7'b0110000;
            4'b1111 : digit0 = 7'b0111000;
            endcase
            
        case(mydigit1)
            4'b0000 : digit1 = 7'b0000001;
            4'b0001 : digit1 = 7'b1001111;
            4'b0010 : digit1 = 7'b0010010;
            4'b0011 : digit1 = 7'b0000110;
            4'b0100 : digit1 = 7'b1001100;
            4'b0101 : digit1 = 7'b0100100;
            4'b0110 : digit1 = 7'b0100000;
            4'b0111 : digit1 = 7'b0001111;
            4'b1000 : digit1 = 7'b0000000;
            4'b1001 : digit1 = 7'b0000100;
            4'b1010 : digit1 = 7'b0001000;
            4'b1011 : digit1 = 7'b1100000;
            4'b1100 : digit1 = 7'b0110001;
            4'b1101 : digit1 = 7'b1000010;
            4'b1110 : digit1 = 7'b0110000;
            4'b1111 : digit1 = 7'b0111000;
            endcase
            
         case(mydigit2)
            4'b0000 : digit2 = 7'b0000001;
            4'b0001 : digit2 = 7'b1001111;
            4'b0010 : digit2 = 7'b0010010;
            4'b0011 : digit2 = 7'b0000110;
            4'b0100 : digit2 = 7'b1001100;
            4'b0101 : digit2 = 7'b0100100;
            4'b0110 : digit2 = 7'b0100000;
            4'b0111 : digit2 = 7'b0001111;
            4'b1000 : digit2 = 7'b0000000;
            4'b1001 : digit2 = 7'b0000100;
            4'b1010 : digit2 = 7'b0001000;
            4'b1011 : digit2 = 7'b1100000;
            4'b1100 : digit2 = 7'b0110001;
            4'b1101 : digit2 = 7'b1000010;
            4'b1110 : digit2 = 7'b0110000;
            4'b1111 : digit2 = 7'b0111000;
            endcase
           
           case(mydigit3)
            4'b0000 : digit3 = 7'b0000001;
            4'b0001 : digit3 = 7'b1001111;
            4'b0010 : digit3 = 7'b0010010;
            4'b0011 : digit3 = 7'b0000110;
            4'b0100 : digit3 = 7'b1001100;
            4'b0101 : digit3 = 7'b0100100;
            4'b0110 : digit3 = 7'b0100000;
            4'b0111 : digit3 = 7'b0001111;
            4'b1000 : digit3 = 7'b0000000;
            4'b1001 : digit3 = 7'b0000100;
            4'b1010 : digit3 = 7'b0001000;
            4'b1011 : digit3 = 7'b1100000;
            4'b1100 : digit3 = 7'b0110001;
            4'b1101 : digit3 = 7'b1000010;
            4'b1110 : digit3 = 7'b0110000;
            4'b1111 : digit3 = 7'b0111000;
            endcase
        
        
        
    
    end
endmodule
