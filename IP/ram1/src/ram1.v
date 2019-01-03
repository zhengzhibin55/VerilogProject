`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/28 21:11:50
// Design Name: 
// Module Name: top
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

module ram1(
 input  clk,
 input reset,
 
 output reg [31: 0] addra,
 output  clka,
 output reg [31:0] dina,
 input  [31:0]douta,
 output reg ena,
 output  rsta,
 output reg [3:0] wea,
 
 output reg [31: 0] addrb,
 output  clkb,
 output reg [31:0] dinb,
 input  [31:0]doutb,
 output reg enb,
 output  rstb,
 output reg [3:0] web
 
    );

 /////////////signals////////////// 
assign clka=clk;
assign clkb=clk;

assign rsta=1'b0;
assign rstb=1'b0;
 
/////////////////////other signals////////////////////////
	
reg [2:0] i;	
reg [4:0] cnt;
reg [4:0] cnt1;

//////////////write a//read b/////////////
always@(posedge clk)
begin
	if(~reset) begin
		ena<=0;wea<=0;addra<=0;dina<=0;i<=0;cnt<=0;enb<=0;web<=0;addrb<=0;dinb<=0;cnt1<=0;
	end
	else begin
	
		case(i)
		
		0:begin
			ena<=1;wea<=4'b1111;i<=1;
		end
		
		1:begin
			if(cnt==10)
				i<=2;
			else begin
				if(cnt1==5) begin    //五个时钟进行BRAM写，确保写正确
					cnt<=cnt+1;
					addra<=addra+4;
					dina<=dina+10;
					cnt1<=0;
				end 
				else begin
					cnt1<=cnt1+1;
				end
			end
		end
		
		2:begin
			wea<=0;enb<=1;i<=3;cnt<=0;
		end
		
		3:begin             //循环进行BRAM读
			if(cnt==10)
				i<=4;
			else begin 
				addrb<=addrb+4;cnt<=cnt+1;
			end
				
		end
		
		4:begin
			cnt<=0;addrb<=0;i<=3;
		end
		
		default:i<=0;
		endcase
	end
end 

//////////////////////////////////////////////////////  

endmodule
