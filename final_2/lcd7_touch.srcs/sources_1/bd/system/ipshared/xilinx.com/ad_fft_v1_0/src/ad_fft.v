`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/14 09:25:59
// Design Name: 
// Module Name: fft_14
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

module ad_fft(
 input        		clk,                  //125mhz
 
 //ad1
 input [15:0]         ad1_data,            //ad7606 采样数据
 input                ad1_busy,            //ad7606 忙标志位 
 output               ad1_cs,              //ad7606 AD cs,与ad1_rd同为低电平是开始读
 output               ad1_rd,              //ad7606 AD data read,与ad1_cs同为低电平开始读
 
 output               ad_reset,           //ad7606 AD reset
 output              ad_convstab,         //ad7606 AD convert start
 output [2:0]         ad_os,              //ad7606 过采样倍率选择
 //ad2
 input [15:0]         ad2_data,            //ad7606 采样数据
 input                ad2_busy,            //ad7606 忙标志位 
 output                ad2_cs,              //ad7606 AD cs,与ad2_rd同为低电平是开始读
 output                ad2_rd,              //ad7606 AD data read,与ad2_cs同为低电平开始读
 ////////////////////后续准备删除引脚/////////////////////////////////////////////////////////
  output               ad2_reset,          
 output              ad2_convstab,        
 output [2:0]         ad2_os,             
  ////////////////////后续准备删除引脚/////////////////////////////////////////////////////////
  output   ad1_range,
  output   ad2_range,
 /////////////////////IP核引脚////////////////////////////////////
input fft_reset,
output [895:0] fft_data,
output reg done
    );
 ////////////////////后续准备删除/////////////////////////////////////////////////////////
	assign ad2_reset=ad_reset;
	assign ad2_convstab=ad_convstab;
	assign ad2_os=3'b110;
	
	assign ad1_range=1;
    assign ad2_range=1;
 ////////////////////后续准备删除/////////////////////////////////////////////////////////

//////ad14////////////    

wire ad_start;
wire wr1_en;                      //fifo使能信号
wire [15:0] ad1_ch1;              //第1通道的数据
wire [15:0] ad1_ch2;              //AD1第2通道的数据
wire [15:0] ad1_ch3;              //AD1第3通道的数据
wire [15:0] ad1_ch4;              //AD1第4通道的数据
wire [15:0] ad1_ch5;              //AD1第5通道的数据
wire [15:0] ad1_ch6;              //AD1第6通道的数据
wire [15:0] ad1_ch7;             //AD1第7通道的数据
//wire [15:0] ad1_ch8;               //AD第8通道的数据    


wire wr2_en;                      //fifo使能信号
wire [15:0] ad2_ch1;              //AD2第1通道的数据
wire [15:0] ad2_ch2;              //AD2第2通道的数据
wire [15:0] ad2_ch3;              //AD2第3通道的数据
wire [15:0] ad2_ch4;              //AD2第4通道的数据
wire [15:0] ad2_ch5;              //AD2第5通道的数据
wire [15:0] ad2_ch6;              //AD2第6通道的数据
wire [15:0] ad2_ch7;             //AD2第7通道的数据
//wire[15:0] ad2_ch8;               //AD第8通道的数据    




//////////fft14///////
	
	
	wire          [31:0] u1_re;
    wire          [31:0] u1_im;
	wire		    [31:0] u2_re;
    wire  		[31:0] u2_im;
	wire  		[31:0] u3_re;
    wire  		[31:0] u3_im;
	wire  		[31:0] u4_re;
    wire  		[31:0] u4_im;
	wire  		[31:0] u5_re;
    wire  		[31:0] u5_im;
	wire  		[31:0] u6_re;
    wire  		[31:0] u6_im;
	wire 			[31:0] u7_re;
    wire  		[31:0] u7_im;
	
	wire          [31:0] i1_re;
    wire          [31:0] i1_im;
	wire		    [31:0] i2_re;
    wire  		[31:0] i2_im;
	wire  		[31:0] i3_re;
    wire  		[31:0] i3_im;
	wire  		[31:0] i4_re;
    wire  		[31:0] i4_im;
	wire  		[31:0] i5_re;
    wire  		[31:0] i5_im;
	wire  		[31:0] i6_re;
    wire  		[31:0] i6_im;
	wire 			[31:0] i7_re;
    wire  		[31:0] i7_im;
		


    wire    done1;
    wire    done2;     
	
	
	
assign fft_data={i1_re,i1_im,i2_re,i2_im,i3_re,i3_im,i4_re,i4_im,i5_re,i5_im,i6_re,i6_im,i7_re,i7_im,u1_re,u1_im,u2_re,u2_im,u3_re,u3_im,u4_re,u4_im,u5_re,u5_im,u6_re,u6_im,u7_re,u7_im};
	
	
////////////转换结束标志信号////////////
	
	reg [1:0] i;	
	reg [2:0] cnt;
    always @(posedge clk)
	begin
		if(~fft_reset) begin
			done<=0;i<=0;cnt<=0;
		end
		else begin
			case (i)
			
			0:begin
				if(done1&&done2) begin
					done<=1'b1;i<=1;
				end
				else begin
					i<=0;
				end
			end	
			1:begin
				if(cnt==4) begin
					done<=0;i<=2;
				end
				else begin
					cnt<=cnt+1;
				end
			end
			2:begin
					done<=0;i<=2;
				end				
				 			
			default: i<=0;
			endcase
		
		end 
	end
	
	
 ///////////////////  
ad14 f1 (
    .clk(clk), 
    .ad1_data(ad1_data), 
    .ad1_busy(ad1_busy), 
    .ad1_cs(ad1_cs), 
    .ad1_rd(ad1_rd), 
    .ad_reset(ad_reset), 
    .ad_convstab(ad_convstab), 
    .ad_os(ad_os), 
    .ad2_data(ad2_data), 
    .ad2_busy(ad2_busy), 
    .ad2_cs(ad2_cs), 
    .ad2_rd(ad2_rd), 
    .wr1_en(wr1_en), 
    .ad1_ch1(ad1_ch1), 
    .ad1_ch2(ad1_ch2), 
    .ad1_ch3(ad1_ch3), 
    .ad1_ch4(ad1_ch4), 
    .ad1_ch5(ad1_ch5), 
    .ad1_ch6(ad1_ch6), 
    .ad1_ch7(ad1_ch7), 
    //.ad1_ch8(ad1_ch8), 
    .wr2_en(wr2_en), 
    .ad2_ch1(ad2_ch1), 
    .ad2_ch2(ad2_ch2), 
    .ad2_ch3(ad2_ch3), 
    .ad2_ch4(ad2_ch4), 
    .ad2_ch5(ad2_ch5), 
    .ad2_ch6(ad2_ch6), 
    .ad2_ch7(ad2_ch7) 
    //.ad2_ch8(ad2_ch8)
    );    
    
	fft14 f2 (
    .clk(clk), 
    .fft_reset(fft_reset), 
    .ad1_ch1(ad1_ch1), 
    .ad1_ch2(ad1_ch2), 
    .ad1_ch3(ad1_ch3), 
    .ad1_ch4(ad1_ch4), 
    .ad1_ch5(ad1_ch5), 
    .ad1_ch6(ad1_ch6), 
    .ad1_ch7(ad1_ch7), 
    .wr1_en(wr1_en), 
    .u1_re(u1_re), 
    .u1_im(u1_im), 
    .u2_re(u2_re), 
    .u2_im(u2_im), 
    .u3_re(u3_re), 
    .u3_im(u3_im), 
    .u4_re(u4_re), 
    .u4_im(u4_im), 
    .u5_re(u5_re), 
    .u5_im(u5_im), 
    .u6_re(u6_re), 
    .u6_im(u6_im), 
    .u7_re(u7_re), 
    .u7_im(u7_im),
    .done1(done1), 
    .ad2_ch1(ad2_ch1), 
    .ad2_ch2(ad2_ch2), 
    .ad2_ch3(ad2_ch3), 
    .ad2_ch4(ad2_ch4), 
    .ad2_ch5(ad2_ch5), 
    .ad2_ch6(ad2_ch6), 
    .ad2_ch7(ad2_ch7), 
    .wr2_en(wr2_en), 
    .i1_re(i1_re), 
    .i1_im(i1_im), 
    .i2_re(i2_re), 
    .i2_im(i2_im), 
    .i3_re(i3_re), 
    .i3_im(i3_im), 
    .i4_re(i4_re), 
    .i4_im(i4_im), 
    .i5_re(i5_re), 
    .i5_im(i5_im), 
    .i6_re(i6_re), 
    .i6_im(i6_im), 
    .i7_re(i7_re), 
    .i7_im(i7_im),
    .done2(done2)
    );
    
	

     
   
endmodule













