`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/08 11:46:21
// Design Name: 
// Module Name: r_ram
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


module r_ram(
	input clk,
	input reset,
	
 output reg [31: 0] addrb,
 output  clkb,
 output reg [31:0] dinb,
 input  [31:0]doutb,
 output reg enb,
 output  rstb,
 output reg [3:0] web
 
    );
    
/////////////signals////////////// 

assign clkb=clk;

assign rstb=1'b0;
 
/////////////////////other signals////////////////////////
	
reg [2:0] i;	
reg [8:0] cnt;


//////////////write a//read b/////////////
always@(posedge clk)
begin
	if(~reset) begin
		i<=0;cnt<=0;enb<=0;web<=0;addrb<=0;dinb<=0;
	end
	else begin
	
		case(i)
		
		0:begin
			enb<=1;i<=1;cnt<=0;
		end
		
		1:begin             //Ñ­»·½øÐÐBRAM¶Á
			addrb<=32'd7000;
				
		end
		
		default:i<=0;
		endcase
	end
end     
	

	
    
endmodule
