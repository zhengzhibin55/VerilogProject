`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/13 22:53:37
// Design Name: 
// Module Name: fft_reset
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
// 接收到ram_done信号后延时一段时间后给fft_reset信号一个低电平，重新开始一次fft及ram写，当所有完成后，置位reset_done
// 这里设置进行3次fft_reset 
//发送fft_reset信号，接收到ram_done信号后，发出继电器命令，等待一段时间后，重新发出fft_reset信号
//四部分程序，发出继电保护，延时、发送fft_reset,接收ram_done,四部分程序为一组
//  这样分别编写，程序太过冗杂，其实延时，发送命令，等待相应的命令都一样，考虑用循环来做，
//////////////////////////////////////////////////////////////////////////////////

module reset1(
    input clk,                   //125M
	input reset,
	
	input ram_done,               //接收到器为高电平后进行fft_reset为低电平时复位
	
	output reg fft_reset,           //每过一段时间，置0一次，表示重启一次fft
	output reg reset_done,        //表示全部结束全部结束，因为要在一次写完后查看是否完成，所以设置为常为1时，表示结束
	output reg [5:0]reset_i,      //表示这是第几次fft，确定ram位置 最多56次
	output reg [14:0] relay
    );

reg [5:0] i;
               
reg [2:0] reset_count;	   //延时5个时钟的fft_reset
reg [29:0] count;          //延时100ms（或者1s）


parameter Delay=30'd25_000_000;	//延时的时间  d250_000_00
parameter relay_num=6'd6;            //继电器动作次数
	
	
always@(posedge clk)
begin
	if(~reset) begin
		i<=0;fft_reset<=0;reset_done<=0;reset_i<=0;reset_count<=0;count<=0;relay<=0;
	end
	else begin
		case(i)
		
		0:begin
			i<=1;fft_reset<=1;
		end
		
/////////////////////////////////第一次继电器动作	
		1:begin
			relay<=15'b000000_000001_011;i<=3;         //1 2 4
		end
		
		2:begin                                      //延时的目的是确保线路拓扑改变后，延迟一段时间确保电压电流稳定
			if(count==Delay) begin
				count<=0;i<=3;
				end
			else begin
				count<=count+1;
			end
		
		end
		
		3:begin
			if(reset_count==5) begin
					reset_count<=0;fft_reset<=1;i<=4;reset_i<=reset_i+1;
			end
			else begin
					reset_count<=reset_count+1;fft_reset<=0;
			end
		
		end
		
		4:begin
		  if(reset_i==relay_num)
			i<=5;
		  else
			i<=6;
		end
		
		5:begin                                      
			if(count==30'd125_000_000) begin
				count<=0;reset_done<=1;relay<=15'b000000_000000_000;
				end
			else begin
				count<=count+1;reset_done<=1;
			end
		
		end
		
		6:begin
			if(ram_done)
				i<=6+reset_i;        //跳转到相应的继电器动作程序
		end
		
///////////////////////第2次继电器动作
		7:begin
			relay<=15'b000000_000001_101;i<=2;       //1 3 4
		end
		///////////////////////第3次继电器动作
		8:begin
			relay<=15'b000000_000010_011;i<=2;     //1 2 5
		end
		///////////////////////第4次继电器动作
		9:begin
			relay<=15'b000000_000010_101;i<=2;   //1 3 5
		end
		///////////////////////第5次继电器动作
		10:begin
			relay<=15'b000000_000100_011;i<=2;  //1 2 6
		end
		///////////////////////第6次继电器动作
		11:begin
			relay<=15'b000000_000100_101;i<=2;   //1 3 6
		end
		///////////////////////第7次继电器动作
		12:begin
			relay<=15'b000000_000111_101;i<=2;   
		end
		///////////////////////第8次继电器动作
		13:begin
			relay<=15'b000000_000111_101;i<=2;
		end
		default:i<=0;
		endcase
	end
end	
	
endmodule
