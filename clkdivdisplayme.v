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


module clkdivdisplayme(
    input clk,
    output clk_out
    );
    
   reg [31:0] COUNT = 32'b00000000000000000000000000000000; //change this to [15:0] for the board, [1:0] for simulation
    assign clk_out = COUNT[13];
    
    always @(posedge clk)
    begin
        COUNT <= COUNT+1;
    end
    
    endmodule
    

