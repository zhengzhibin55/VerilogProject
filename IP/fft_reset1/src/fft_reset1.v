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
//�Ĳ��ֳ��򣬷����̵籣������ʱ������fft_reset,����ram_done,�Ĳ��ֳ���
//���������ӳ��������Ϳ���ѡ�񵥻ػ���˫����·
//////////////////////////////////////////////////////////////////////////////////

module fft_reset1(
    input clk,
	input reset,
	input ram_done,               //���յ���Ϊ�ߵ�ƽ�����fft_resetΪ�͵�ƽʱ��λ
	input  [31:0]doutb,
	
	output reg fft_reset,           //ÿ��һ��ʱ�䣬��0һ�Σ���ʾ����һ��fft
	output reg reset_done,        //��ʾȫ������ȫ����������ΪҪ��һ��д���鿴�Ƿ���ɣ���������Ϊ��Ϊ1ʱ����ʾ����
	output reg [14:0] relay,        //����15·�̵�����relay[0]��ʾ�̵���1��
	output reg [2:0] choise,        //��1���裿2˫�裿3���ݣ�4˫�ݣ�
	output reg [5:0]reset_i      //��ʾ���ǵڼ���fft��ȷ��ramλ�� ���56��
    );

/////////////////////////
/////1����
wire fft_reset1;
wire reset_done1;
wire [5:0]reset_i1;
wire [14:0] relay1;
/////2˫��
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
            /////�ȴ�
            0:begin
                if((doutb==32'h0f0f0f01)||(doutb==32'h0f0f0f02)) begin
                        i<=1;
                    end
                else begin
                    i<=0;choise<=0;
                end
            end                    
 
 		/////��������
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

        	/////��ʱ
		    2:begin       
		    if(count==10) begin
                i<=3;count<=0;
            end
		    else begin
                count<=count+1;
            end
		    end          
            
	/////����
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



	