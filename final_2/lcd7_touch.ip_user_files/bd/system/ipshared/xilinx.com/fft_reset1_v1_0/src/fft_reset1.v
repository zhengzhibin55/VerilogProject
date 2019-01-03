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
//四部分程序，发出继电保护，延时、发送fft_reset,接收ram_done,四部分程序
//设置两个子程序，这样就可以选择单回还是双回线路
//////////////////////////////////////////////////////////////////////////////////

module fft_reset1(
    input clk,
	input reset,
	input ram_done,               //接收到器为高电平后进行fft_reset为低电平时复位
	input  [31:0]doutb,
	
	output reg fft_reset,           //每过一段时间，置0一次，表示重启一次fft
	output reg reset_done,        //表示全部结束全部结束，因为要在一次写完后查看是否完成，所以设置为常为1时，表示结束
	output reg [14:0] relay,        //代表15路继电器，relay[0]表示继电器1，
	output reg [2:0] choise,        //（1单阻？2双阻？3单容？4双容？
	output reg [5:0]reset_i      //表示这是第几次fft，确定ram位置 最多56次
    );

/////////////////////////
/////1单阻
wire fft_reset1;
wire reset_done1;
wire [5:0]reset_i1;
wire [14:0] relay1;
/////2双阻
wire fft_reset2;
wire reset_done2;
wire [5:0]reset_i2;
wire [14:0] relay2;
/////////////////////////
reg [2:0] i;
reg [3:0] count;
reg reset_f;



always@(posedge clk)
	begin
		if(~reset) begin
                i<=0;choise<=0;count<=0;
            end
            else begin
		      case(i)
            /////等待
            0:begin
                if((doutb==32'h0f0f0f01)||(doutb==32'h0f0f0f02)) begin
                        i<=1;
                    end
                else begin
                    i<=0;choise<=0;
                end
            end                    
 
 		/////发出命令
            1:begin
                if(doutb==32'h0f0f0f01) begin
                    choise<=1;i<=2;
                end
                else if(doutb==32'h0f0f0f02) begin
                    choise<=2;i<=2;
                end
                else begin
                    choise<=0;i<=1;
                end                    
            end    

        	/////延时
		    2:begin       
		    if(count==10) begin
                i<=3;count<=0;
            end
		    else begin
                count<=count+1;
            end
		    end          
            
	/////闭锁
            3:begin
                if(relay==0) begin
                    i<=0;
                end
                else begin
                    i<=3;
                end
            end             
         
         
            
		default:i<=0;
            endcase            
            
            end
	end



always@(posedge clk)
	begin
		case(choise)
		
		1:begin
			fft_reset<=fft_reset1;reset_done<=reset_done1;reset_i<=reset_i1;relay<=relay1;reset_f<=1;
		end
		
		2:begin
			fft_reset<=fft_reset2;reset_done<=reset_done2;reset_i<=reset_i2;relay<=relay2;reset_f<=1;
		end
		
		default:begin
			reset_f<=0;
		end
		endcase
	end	
	
	
reset1 f1 (
    .clk(clk), 
    .reset(reset&reset_f), 
    .ram_done(ram_done), 
    .fft_reset(fft_reset1), 
    .reset_done(reset_done1), 
    .reset_i(reset_i1),
	.relay(relay1)
    );	
	
reset2 f2 (
    .clk(clk), 
    .reset(reset&reset_f), 
    .ram_done(ram_done), 
    .fft_reset(fft_reset2), 
    .reset_done(reset_done2), 
    .reset_i(reset_i2),
	.relay(relay2)
    );		
	
	
	
endmodule



	