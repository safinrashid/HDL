`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 11:07:11 AM
// Design Name: 
// Module Name: clkdiv
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


module clkdiv(
    input clk,
    output reg clk_out
    );
    
   reg [32:0] COUNT = 32'd0; //change this to [15:0] for the board, [1:0] for simulation
   
   
//    assign clk_out = COUNT[15];
    
//    always@(posedge clk)
//    begin
//        COUNT = COUNT+1;
//        end
    initial clk_out = 0;
    
    always @(posedge clk)
    begin
        
            if (COUNT < 32'd999999)
            begin
                COUNT <= COUNT+1;
                clk_out <= 0;
                end
            else
                begin
                clk_out <= 1;
                COUNT <= 0;
                end
                
            
                end
               
    
    
    endmodule
    

