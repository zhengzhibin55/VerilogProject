`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:20 11/29/2017 
// Design Name: 
// Module Name:    ad7 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ad1(
   input        		clk,                  //50mhz
	//input        		reset,
	
	input [15:0] 		ad1_data,            //ad7606 采样数据
	input        		ad1_busy,            //ad7606 忙标志位 
	output reg   		ad1_cs,              //ad7606 AD cs，与ad1_rd同为低电平是开始读
	output reg   		ad1_rd,              //ad7606 AD data read，与ad1_cs同为低电平开始读
	output reg   		ad_reset,           	//ad7606 AD reset
	output reg   		ad_convstab,         //ad7606 AD convert start
	output [2:0] 		ad_os,              //ad7606 过采样倍率选择
	
	output reg 			ad_start,
   output reg 			wr1_en,                      //fifo使能信号
	output reg 			[15:0] ad1_ch1,              //AD第1通道的数据
	output reg 			[15:0] ad1_ch2,              //AD第2通道的数据
	output reg 			[15:0] ad1_ch3,              //AD第3通道的数据
	output reg 			[15:0] ad1_ch4,              //AD第4通道的数据
	output reg 			[15:0] ad1_ch5,              //AD第5通道的数据
	output reg 			[15:0] ad1_ch6,              //AD第6通道的数据
	output reg 			[15:0] ad1_ch7,              //AD第7通道的数据
	output reg 			[15:0] ad1_ch8               //AD第8通道的数据
   
    );

reg [31:0]  cnt;
reg [30:0]  cnt2;
reg [5:0] i;
reg [3:0] state;



 //reg wr1_en;                      //fifo使能信号
 //reg [15:0] ad1_ch1;              //AD第1通道的数据
 //reg [15:0] ad1_ch2;              //AD第2通道的数据
 //reg [15:0] ad1_ch3;              //AD第3通道的数据
 //reg [15:0] ad1_ch4;              //AD第4通道的数据
 //reg [15:0] ad1_ch5;              //AD第5通道的数据
 //reg [15:0] ad1_ch6;              //AD第6通道的数据
 //reg [15:0] ad1_ch7;             //AD第7通道的数据
 //reg [15:0] ad1_ch8;               //AD第8通道的数据	






parameter IDLE=4'd0;
parameter AD_CONV=4'd1;
parameter Wait_1=4'd2;
parameter Wait_busy=4'd3;
parameter REad1_ch1=4'd4;
parameter REad1_ch2=4'd5;
parameter REad1_ch3=4'd6;
parameter REad1_ch4=4'd7;
parameter REad1_ch5=4'd8;
parameter REad1_ch6=4'd9;
parameter REad1_ch7=4'd10;
parameter REad1_ch8=4'd11;
parameter READ_DONE=4'd12;
parameter ENABLE_W=4'd13;
parameter CLOSE_W=4'd14;

assign ad_os=3'b110;    //不使用过采样
//AD 复位电路 
always@(posedge clk)
 begin
 if(cnt<32'd125_000_00) begin
        cnt<=cnt+1;
        ad_reset<=1'b1;
      end
      else
        ad_reset<=1'b0;       
   end

//125MM时钟下，每过122070时钟进行AD，则采样频率微1024hz.
//100MM时钟下，每过97656时钟进行AD，则采样频率微1024hz.
//150MM时钟下，每过146484时钟进行AD，则采样频率微1024hz.
always@(posedge clk)
 begin
    if(cnt2==31'd97655) begin    
        cnt2<=0;           //100MM时钟下，每过97656时钟进行AD，则采样频率微1024hz.
        ad_start<=1'b1;
      end
      else begin
		  cnt2<=cnt2+1;
        ad_start<=1'b0;
      end		  
   end

always @(posedge clk) 
 begin
 	 if (ad_reset==1'b1) begin 
			 state<=IDLE; 
			 ad1_ch1<=0;
			 ad1_ch2<=0;
			 ad1_ch3<=0;
			 ad1_ch4<=0;
			 ad1_ch5<=0;
			 ad1_ch6<=0;
			 ad1_ch7<=0;
			 ad1_ch8<=0;
			 ad1_cs<=1'b1;
			 ad1_rd<=1'b1; 
			 ad_convstab<=1'b1;
			 i<=0;
			 wr1_en<=0;
	 end		 
	 else begin
		  case(state)
		  IDLE: begin
				 if(ad_start==1) begin
 				   state<=AD_CONV;
				 end
		  	   else begin
		   	 ad1_cs<=1'b1;
		   	 ad1_rd<=1'b1; 
			    ad_convstab<=1'b1;
			    i<=0;
				 wr1_en<=0;
				 end
		  end  
		  
		  AD_CONV: begin	   
				 if(i==2) begin                        //等待2个clock
					 i<=0;			 
					 state<=Wait_1;
					 ad_convstab<=1'b1;       				 
				 end
				 else begin
					 i<=i+1'b1;
					 ad_convstab<=1'b0;                     //启动AD转换
				 end
		  end
		  Wait_1: begin            
				 if(i==5) begin                           //等待5个clock, 等待busy信号为高
					 i<=0;
					 state<=Wait_busy;
				 end
				 else 
					 i<=i+1'b1;
		  end		 
		  Wait_busy: begin            
				 if(ad1_busy==1'b0) begin                    //等待busy信号为低
					 i<=0;			 
					 state<=REad1_ch1;
				 end
		  end
		  REad1_ch1: begin 
				 ad1_cs<=1'b0;                              //cs信号有效	  
				 if(i==3) begin
					 ad1_rd<=1'b1;
					 i<=0;
					 ad1_ch1<=ad1_data;                        //读CH1
					 state<=REad1_ch2;				 
				 end
				 else begin
					 ad1_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  REad1_ch2: begin 
				 if(i==3) begin
					 ad1_rd<=1'b1;
					 i<=0;
					 ad1_ch2<=ad1_data;                        //读CH2
					 state<=REad1_ch3;				 
				 end
				 else begin
					 ad1_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  REad1_ch3: begin 
				 if(i==3) begin
					 ad1_rd<=1'b1;
					 i<=0;
					 ad1_ch3<=ad1_data;                        //读CH3
					 state<=REad1_ch4;				 
				 end
				 else begin
					 ad1_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  REad1_ch4: begin 
				 if(i==3) begin
					 ad1_rd<=1'b1;
					 i<=0;
					 ad1_ch4<=ad1_data;                        //读CH4
					 state<=REad1_ch5;				 
				 end
				 else begin
					 ad1_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  REad1_ch5: begin 
				 if(i==3) begin
					 ad1_rd<=1'b1;
					 i<=0;
					 ad1_ch5<=ad1_data;                        //读CH5
					 state<=REad1_ch6;				 
				 end
				 else begin
					 ad1_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  REad1_ch6: begin 
				 if(i==3) begin
					 ad1_rd<=1'b1;
					 i<=0;
					 ad1_ch6<=ad1_data;                        //读CH6
					 state<=REad1_ch7;				 
				 end
				 else begin
					 ad1_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  REad1_ch7: begin 
				 if(i==3) begin
					 ad1_rd<=1'b1;
					 i<=0;
					 ad1_ch7<=ad1_data;                        //读CH7
					 state<=REad1_ch8;				 
				 end
				 else begin
					 ad1_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  REad1_ch8: begin 
				 if(i==3) begin
					 ad1_rd<=1'b1;
					 i<=0;
					 ad1_ch8<=ad1_data;                        //读CH8
					 state<=READ_DONE;				 
				 end
				 else begin
					 ad1_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  
		  
		  READ_DONE:begin
					 ad1_rd<=1'b1;	 
					 ad1_cs<=1'b1;
					 state<=ENABLE_W;
					 wr1_en<=0;
		  end		
		  
		  ENABLE_W:begin
					 wr1_en<=1;
					 state<=CLOSE_W;
		  end	

		  CLOSE_W:begin
					 wr1_en<=0;
					 state<=IDLE;
		  end			  
		  
		  
		  default:	state<=IDLE;
		  endcase	
      
	end			 
 end
endmodule
