`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/01 21:43:26
// Design Name: 
// Module Name: reset
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


module reset(
input clk,
output reg  reset
    );
    
    
  reg [12:0] cnt;
    
always@(posedge clk)
    begin
    
        if(cnt==5000) begin
            reset<=1;
            end 
        else begin
            reset<=0;
            cnt<=cnt+1;
        end 
        end 
        
    
  
    
    
    
   
    
    
endmodule
