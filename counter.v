`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2022 10:50:19 AM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input startbutton,
    input reset,
    input [1:0] select,
    input [3:0] loadmeMSD,
    input [3:0] loadmeLSD,
    output wire [6:0] sseg,
    output wire [3:0] an,
    output wire dp
    
    
    
    
    );
    
    
    reg [3:0] next_state;
    
    reg toggle;
    wire slow_clk;
    
    reg togglecheck;
    
    reg [15:0] count;
    reg [3:0] state;
    

    wire [7:0] digit0;
    wire [7:0] digit1;
    wire [7:0] digit2;
    wire [7:0] digit3;
    
    
    
    
    
    binarytodecimal bd(.count(count), .digit0(digit0), .digit1(digit1), .digit2(digit2), .digit3(digit3));
    //feed those 4 decimal values to a converter module which puts the result into the seven-segment display.
    
    
    
    
    wire display_clk;
    
    
    
   
    
    clkdiv c5(.clk(clk), .clk_out(slow_clk));
    clkdivdisplayme c6(.clk(clk), .clk_out(display_clk));
    
    display_timer mytime(.display_clk(display_clk), .digit0(digit0), .digit1(digit1), .digit2(digit2), .digit3(digit3), .sseg(sseg), .an(an), .dp(dp));
    
    reg [3:0] statecheck;
   
    
    
    localparam [3:0] State_Start = 0,
                     State_Countup_NoLoad = 1,
                     State_Countup_YesLoad = 2,
                     State_Countdown_NoLoad = 3,
                     State_Countdown_YesLoad = 4,
                     State_Countup_Work = 5,
                     State_Countdown_Work = 6,
                     State_Stop_Countup = 7,
                     State_Countup_Wait = 8,
                     State_Countdown_Wait = 9,
                     State_Stop_FromUp_Wait = 10,
                     State_Stop_FromDown_Wait = 11,
                     State_Stop_ToUp_Wait = 12,
                     State_Stop_ToDown_Wait = 13,
                     State_Stop_Countdown = 14;
                     
                     
    
    //engine to keep states moving along.
    always@(posedge slow_clk) begin
    
        
        
        state <= next_state;
        toggle <= ~toggle;
        end
    
    always@(posedge slow_clk) begin
    
        case(state)
        State_Countup_NoLoad: count <= 0;
        State_Countup_Work: begin
        if(count != 9999)
            count <= count+1;
            end
        State_Countdown_NoLoad: count <= 9999;
        State_Countdown_Work: begin
         if(count != 0)
         count <= count-1;
         end
        State_Countup_YesLoad: count <= loadmeMSD*1000 + loadmeLSD*100;
        State_Countdown_YesLoad: count <= loadmeMSD*1000 + loadmeLSD*100;
        default: begin
            end
            
            endcase
            
            end
        
    //state machine:
    
    initial begin
    state = State_Start;
    next_state = State_Start;
    toggle = 1'b0;
    
    
    
    
    
    end
    
    
    
    always@(toggle) begin
        togglecheck <= toggle;
       
        
        
        
        
       
        //start state block
        case(state)
        State_Start:
        begin
            if(select == 2'b00)
                begin
                next_state = State_Countup_NoLoad;
                end
            else if (select == 2'b01)
                begin
                next_state = State_Countup_YesLoad;
                end
            else if (select == 2'b10)
                begin
                next_state = State_Countdown_NoLoad;
                end
            else if (select == 2'b11)
                begin
                next_state = State_Countdown_YesLoad;
                end
            end
            //end start state block
          
          //Countup Noload setup and wait for edge. Wait state is used to ensure button is pressed and unpressed.
          State_Countup_NoLoad: begin
                
                
                if((startbutton == 1'b1) && (reset != 1))
                    next_state = State_Countup_Wait;
                else if((startbutton == 1'b0) && (reset != 1))
                    next_state = State_Countup_NoLoad;
                else if((reset == 1))
                    next_state = State_Start;
                end
          
                
                
         //Countup Yesload setup. Wait state is used to ensure button is pressed and unpressed;
          State_Countup_YesLoad: begin
            
            
            if((startbutton == 1'b1) && (reset != 1)) 
                next_state = State_Countup_Wait;
            else if((startbutton == 1'b0) && (reset != 1)) 
                next_state = State_Countup_YesLoad;
            else if(reset == 1)
                next_state = State_Start;
             end
          //Wait for startbutton to not be pressed, for countup.  
           State_Countup_Wait: begin
                if(startbutton == 1'b0)
                    next_state = State_Countup_Work;
                else
                    next_state = State_Countup_Wait;
                end  
             
         //setup for countdown.
         State_Countdown_NoLoad: begin
        
                
                if((startbutton == 1'b1) && (reset != 1))
                    next_state = State_Countdown_Wait;
                else if((startbutton == 1'b0) && (reset != 1)) 
                    next_state = State_Countdown_NoLoad;
                else if(reset == 1)
                    next_state = State_Start;
                end
         State_Countdown_YesLoad: begin
                
                if((startbutton == 1'b1) && (reset != 1))
                    next_state = State_Countdown_Wait;
                else if ((startbutton == 1'b0) && (reset != 1))
                    next_state = State_Countdown_YesLoad;
                else if(reset == 1)
                    next_state = State_Start;
                end
         //wait for the start button to be released.
        State_Countdown_Wait: begin
                if(startbutton == 1'b0)
                    next_state = State_Countdown_Work;
                else
                    next_state = State_Countdown_Wait;
                end  
          
         
         //work states, either counting up or counting down
         
         State_Countup_Work: begin
                
                
             
                
                if(((count != 16'd9999) && (startbutton == 0)) && (reset != 1)) begin
                    next_state = State_Countup_Work;
                    end
                else if(((count == 16'd9999) || (startbutton == 1)) && (reset != 1))
                    next_state = State_Stop_FromUp_Wait;  
                else if(reset == 1)
                    next_state = State_Start;
                    
                    
                end
            
          State_Countdown_Work: begin
                
                
                
           
                    
                if( ((count != 16'd0) && (startbutton == 0)) && (reset != 1)) begin
                    next_state = State_Countdown_Work;
                    end
                else if(((count == 16'd0) || (startbutton == 1))&& (reset != 1))
                    next_state = State_Stop_FromDown_Wait;  
                else if(reset == 1)
                    next_state = State_Start;  
            
            
                end
         
            
         //wait states to get the clock edge when leaving the work state.
         
         State_Stop_FromUp_Wait: begin
                
                if(startbutton == 0)
                    next_state = State_Stop_Countup;
                else
                    next_state = State_Stop_FromUp_Wait;
         
            end
            
         State_Stop_FromDown_Wait: begin
                
                if(startbutton == 0)
                    next_state = State_Stop_Countdown;
                else
                    next_state = State_Stop_FromDown_Wait;
         
            end
            
            
         //wait states to get the clock edge when leaving the stop state.
         State_Stop_ToUp_Wait: begin
                if(startbutton == 0)
                    next_state = State_Countup_Work;
                else
                    next_state = State_Stop_ToUp_Wait;
         
         end
         
         State_Stop_ToDown_Wait: begin
                if(startbutton == 0)
                    next_state = State_Countdown_Work;
                else
                    next_state = State_Stop_ToDown_Wait;
                    
         end          
        //stop state
        
        State_Stop_Countup: begin
            if((reset != 1) && (startbutton == 0))
                next_state = State_Stop_Countup;
            else if((reset != 1) && (startbutton == 1))
                    next_state = State_Stop_ToUp_Wait;
                 
            else if(reset == 1)
                next_state = State_Start;
                
          end
          
          State_Stop_Countdown: begin
            if((reset != 1) && (startbutton == 0))
                next_state = State_Stop_Countdown;
            else if((reset != 1) && (startbutton == 1))
                    next_state = State_Stop_ToDown_Wait;
                 
            else if(reset == 1)
                next_state = State_Start;
              end      
         
         default: begin
         next_state = State_Start;
         end
         
            endcase
    
    
        end
        
    
endmodule
