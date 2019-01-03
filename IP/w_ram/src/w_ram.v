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

module w_ram(
 input  clk,
 //input reset,          //�տ�ʼ����һ��ʱ�䣬��ʼ��ϵͳ
 
 ////////////fft_reset ///////////////////////
 
 input fft_reset,    //ÿ��һ��ʱ�䣬��0һ�Σ���ʾ����һ��fft
 input reset_done,        //��ʾȫ������ȫ����������ΪҪ��һ��д���鿴�Ƿ���ɣ���������Ϊ��Ϊ1ʱ����ʾ����
 input [2:0] choise,   //ѡ������һ�������1���裿2˫�裿3���ݣ�4˫�ݣ�����ѡ��ͬ����ram��ִ�еĳ���Ҳ�᲻ͬ��
 input [5:0]reset_i,      //��ʾ���ǵڼ���fft��ȷ��ramλ�� ���56��
 
///////////////ad_fft///////////// 
input [895:0] fft_data,  //�Ӹ�λΪu1,��λΪi7
input done,

output reg ram_done,         //һ��д��ɺ�Ϊ�ߵ�ƽ��ֱ��fft_resetΪ�͵�ƽʱ��λ
 ////////////��ram���ź�///////////////��һ��д��󣬲鿴reset_done�Ƿ�Ϊ�ߵ�ƽ
 
 output reg [31: 0] addra,
 output  clka,
 output reg [31:0] dina,
 input  [31:0]douta,
 output reg ena,
 output  rsta,
 output reg [3:0] wea
 
 //output reg [31: 0] addrb,
 //output  clkb,
 //output reg [31:0] dinb,
 //input  [31:0]doutb,
 //output reg enb,
 //output  rstb,
 //output reg [3:0] web
 
    );


		
/////////////signals////////////// 

 
/////////////////////other signals////////////////////////
	
 /////////////signals////////////// 
assign clka=clk;

assign rsta=1'b0;

 
/////////////////////other signals////////////////////////
	
reg [5:0] i;	
reg [31:0] cnt;


//////////////write a//read b/////////////����ram��0λ�õ�д����λ��4��ʼд���������
/////////��ʼ����fft_reset�����㣬Ȼ���ж�done�źſ�ʼд��дʱ���õ�reset_i�ĳ˷���һ��д�������ж��Ƿ������δ����������д�����������choise����д
always@(posedge clk)
begin
	if(~fft_reset) begin
		ena<=0;wea<=0;addra<=0;dina<=0;i<=0;cnt<=0;ram_done<=0;
	end
	else begin
			case(i)
				
			0:if(done) begin
				ena<=1;wea<=4'b1111;i<=1;ram_done<=0;
			end	
		
			1:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[895:864];
					cnt<=cnt+1;
				end
			2:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[863:832];
					cnt<=cnt+1;
				end

			3:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[831:800];
					cnt<=cnt+1;
				end
			4:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[799:768];
					cnt<=cnt+1;
				end	

			5:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[767:736];
					cnt<=cnt+1;
				end
			6:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[735:704];
					cnt<=cnt+1;
				end	

			7:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[703:672];
					cnt<=cnt+1;
				end
			8:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[671:640];
					cnt<=cnt+1;
				end	

			9:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[639:608];
					cnt<=cnt+1;
				end
			10:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[607:576];
					cnt<=cnt+1;
				end	

			11:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[575:544];
					cnt<=cnt+1;
				end
			12:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[543:512];
					cnt<=cnt+1;
				end	

			13:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[511:480];
					cnt<=cnt+1;
				end
			14:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[479:448];
					cnt<=cnt+1;
				end	

			15:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[447:416];
					cnt<=cnt+1;
				end
			16:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[415:384];
					cnt<=cnt+1;
				end

			17:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[383:352];
					cnt<=cnt+1;
				end
			18:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[351:320];
					cnt<=cnt+1;
				end	

			19:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[319:288];
					cnt<=cnt+1;
				end
			20:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[287:256];
					cnt<=cnt+1;
				end	

			21:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[255:224];
					cnt<=cnt+1;
				end
			22:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[223:192];
					cnt<=cnt+1;
				end	

			23:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[191:160];
					cnt<=cnt+1;
				end
			24:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[159:128];
					cnt<=cnt+1;
				end	

			25:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[127:96];
					cnt<=cnt+1;
				end
			26:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[95:64];
					cnt<=cnt+1;
				end	

			27:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[63:32];
					cnt<=cnt+1;
				end
			28:if(cnt==3) begin    //3��ʱ�ӽ���BRAMд��ȷ��д��ȷ
					i<=i+1;
					cnt<=0;
					ram_done<=1;           //һ��д���
				end 
				else begin
				    addra<=(i*4+112*(reset_i-1));
					dina<=fft_data[31:0];
					cnt<=cnt+1;
				end				
				
		29:begin              //�ж��Ƿ���������������30д���һ�������������¿�ʼ0
			if(reset_done) begin 
				i<=30;
			end
			else begin
				i<=0;ena<=0;
			end
		end 
			
		30:begin
			case(choise)
			
			0:begin
				addra<=32'd8000;dina<=32'hf0f0f0f0;i<=31;
			end
			
			1:begin
				addra<=32'd8000;dina<=32'hf0f0f0f1;i<=31;
			end
			2:begin
				addra<=32'd8000;dina<=32'hf0f0f0f2;i<=31;
			end
			3:begin
				addra<=32'd8000;dina<=32'hf0f0f0f3;i<=31;
			end
			4:begin
				addra<=32'd8000;dina<=32'hf0f0f0f4;i<=31;
			end
			
			default:i<=31;
			endcase 
		end
		
		31:begin           
			if(cnt==250_000_000) begin 
				addra<=32'd8000;dina<=0;
			end
			else begin
				ram_done<=0;cnt=cnt+1;
			end
		end 		
			

		
		default:i<=0;
		endcase
	end
end 


//////////////////////////////////////////////////////  



endmodule
