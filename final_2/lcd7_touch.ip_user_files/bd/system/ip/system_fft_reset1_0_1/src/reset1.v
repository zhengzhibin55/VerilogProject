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
// ���յ�ram_done�źź���ʱһ��ʱ����fft_reset�ź�һ���͵�ƽ�����¿�ʼһ��fft��ramд����������ɺ���λreset_done
// �������ý���3��fft_reset 
//����fft_reset�źţ����յ�ram_done�źź󣬷����̵�������ȴ�һ��ʱ������·���fft_reset�ź�
//�Ĳ��ֳ��򣬷����̵籣������ʱ������fft_reset,����ram_done,�Ĳ��ֳ���Ϊһ��
//  �����ֱ��д������̫�����ӣ���ʵ��ʱ����������ȴ���Ӧ�����һ����������ѭ��������
//////////////////////////////////////////////////////////////////////////////////

module reset1(
    input clk,                   //125M
	input reset,
	
	input ram_done,               //���յ���Ϊ�ߵ�ƽ�����fft_resetΪ�͵�ƽʱ��λ
	
	output reg fft_reset,           //ÿ��һ��ʱ�䣬��0һ�Σ���ʾ����һ��fft
	output reg reset_done,        //��ʾȫ������ȫ����������ΪҪ��һ��д���鿴�Ƿ���ɣ���������Ϊ��Ϊ1ʱ����ʾ����
	output reg [5:0]reset_i,      //��ʾ���ǵڼ���fft��ȷ��ramλ�� ���56��
	output reg [14:0] relay
    );

reg [5:0] i;
               
reg [2:0] reset_count;	   //��ʱ5��ʱ�ӵ�fft_reset
reg [29:0] count;          //��ʱ100ms������1s��


parameter Delay=30'd25_000_000;	//��ʱ��ʱ��  d250_000_00
parameter relay_num=6'd6;            //�̵�����������
	
	
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
		
/////////////////////////////////��һ�μ̵�������	
		1:begin
			relay<=15'b000000_000001_011;i<=3;         //1 2 4
		end
		
		2:begin                                      //��ʱ��Ŀ����ȷ����·���˸ı���ӳ�һ��ʱ��ȷ����ѹ�����ȶ�
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
				i<=6+reset_i;        //��ת����Ӧ�ļ̵�����������
		end
		
///////////////////////��2�μ̵�������
		7:begin
			relay<=15'b000000_000001_101;i<=2;       //1 3 4
		end
		///////////////////////��3�μ̵�������
		8:begin
			relay<=15'b000000_000010_011;i<=2;     //1 2 5
		end
		///////////////////////��4�μ̵�������
		9:begin
			relay<=15'b000000_000010_101;i<=2;   //1 3 5
		end
		///////////////////////��5�μ̵�������
		10:begin
			relay<=15'b000000_000100_011;i<=2;  //1 2 6
		end
		///////////////////////��6�μ̵�������
		11:begin
			relay<=15'b000000_000100_101;i<=2;   //1 3 6
		end
		///////////////////////��7�μ̵�������
		12:begin
			relay<=15'b000000_000111_101;i<=2;   
		end
		///////////////////////��8�μ̵�������
		13:begin
			relay<=15'b000000_000111_101;i<=2;
		end
		default:i<=0;
		endcase
	end
end	
	
endmodule
