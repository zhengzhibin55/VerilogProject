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
module ad2(
   input        		clk,                  //50mhz
	//input        		reset,
	
	input [15:0] 		ad2_data,            //ad7606 采样数据
	input        		ad2_busy,            //ad7606 忙标志位 
	output reg   		ad2_cs,              //ad7606 AD cs，与ad2_rd同为低电平是开始读
	output reg   		ad2_rd,              //ad7606 AD data read，与ad2_cs同为低电平开始读
	
	//from ad1
	input					ad_reset,
	input 				ad_start,	
	
   output reg wr2_en,                      //fifo使能信号
	output reg [15:0] ad2_ch1,              //AD第1通道的数据
	output reg [15:0] ad2_ch2,              //AD第2通道的数据
	output reg [15:0] ad2_ch3,              //AD第3通道的数据
	output reg [15:0] ad2_ch4,              //AD第4通道的数据
	output reg [15:0] ad2_ch5,              //AD第5通道的数据
	output reg [15:0] ad2_ch6,              //AD第6通道的数据
	output reg [15:0] ad2_ch7,              //AD第7通道的数据
	output reg [15:0] ad2_ch8               //AD第8通道的数据	
    );

reg [5:0] i;
reg [3:0] state;


 //reg wr2_en;                      //fifo使能信号
 //reg [15:0] ad2_ch1;              //AD第1通道的数据
 //reg [15:0] ad2_ch2;              //AD第2通道的数据
 //reg [15:0] ad2_ch3;              //AD第3通道的数据
 //reg [15:0] ad2_ch4;              //AD第4通道的数据
 //reg [15:0] ad2_ch5;              //AD第5通道的数据
 //reg [15:0] ad2_ch6;              //AD第6通道的数据
 //reg [15:0] ad2_ch7;             //AD第7通道的数据
 //reg [15:0] ad2_ch8;               //AD第8通道的数据	



parameter IDLE=4'd0;
parameter AD_CONV=4'd1;
parameter Wait_1=4'd2;
parameter Wait_busy=4'd3;
parameter REad2_ch1=4'd4;
parameter REad2_ch2=4'd5;
parameter REad2_ch3=4'd6;
parameter REad2_ch4=4'd7;
parameter REad2_ch5=4'd8;
parameter REad2_ch6=4'd9;
parameter REad2_ch7=4'd10;
parameter REad2_ch8=4'd11;
parameter READ_DONE=4'd12;
parameter ENABLE_W=4'd13;
parameter CLOSE_W=4'd14;




always @(posedge clk) 
 begin
 	 if (ad_reset==1'b1) begin 
			 state<=IDLE; 
			 ad2_ch1<=0;
			 ad2_ch2<=0;
			 ad2_ch3<=0;
			 ad2_ch4<=0;
			 ad2_ch5<=0;
			 ad2_ch6<=0;
			 ad2_ch7<=0;
			 ad2_ch8<=0;
			 ad2_cs<=1'b1;
			 ad2_rd<=1'b1; 
			 //ad_convstab<=1'b1;
			 i<=0;
			 wr2_en<=0;
	 end		 
	 else begin
		  case(state)
		  IDLE: begin
				 if(ad_start==1) begin
 				   state<=AD_CONV;
				 end
		  	   else begin
		   	 ad2_cs<=1'b1;
		   	 ad2_rd<=1'b1; 
			    //ad_convstab<=1'b1;
			    i<=0;
				 wr2_en<=0;
				 end
		  end  
		  
		  AD_CONV: begin	   
				 if(i==2) begin                        //等待2个clock
					 i<=0;			 
					 state<=Wait_1;
					 //ad_convstab<=1'b1;       				 
				 end
				 else begin
					 i<=i+1'b1;
					 //ad_convstab<=1'b0;                     //启动AD转换
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
				 if(ad2_busy==1'b0) begin                    //等待busy信号为低
					 i<=0;			 
					 state<=REad2_ch1;
				 end
		  end
		  REad2_ch1: begin 
				 ad2_cs<=1'b0;                              //cs信号有效	  
				 if(i==3) begin
					 ad2_rd<=1'b1;
					 i<=0;
					 ad2_ch1<=ad2_data;                        //读CH1
					 state<=REad2_ch2;				 
				 end
				 else begin
					 ad2_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  REad2_ch2: begin 
				 if(i==3) begin
					 ad2_rd<=1'b1;
					 i<=0;
					 ad2_ch2<=ad2_data;                        //读CH2
					 state<=REad2_ch3;				 
				 end
				 else begin
					 ad2_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  REad2_ch3: begin 
				 if(i==3) begin
					 ad2_rd<=1'b1;
					 i<=0;
					 ad2_ch3<=ad2_data;                        //读CH3
					 state<=REad2_ch4;				 
				 end
				 else begin
					 ad2_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  REad2_ch4: begin 
				 if(i==3) begin
					 ad2_rd<=1'b1;
					 i<=0;
					 ad2_ch4<=ad2_data;                        //读CH4
					 state<=REad2_ch5;				 
				 end
				 else begin
					 ad2_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  REad2_ch5: begin 
				 if(i==3) begin
					 ad2_rd<=1'b1;
					 i<=0;
					 ad2_ch5<=ad2_data;                        //读CH5
					 state<=REad2_ch6;				 
				 end
				 else begin
					 ad2_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  REad2_ch6: begin 
				 if(i==3) begin
					 ad2_rd<=1'b1;
					 i<=0;
					 ad2_ch6<=ad2_data;                        //读CH6
					 state<=REad2_ch7;				 
				 end
				 else begin
					 ad2_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  REad2_ch7: begin 
				 if(i==3) begin
					 ad2_rd<=1'b1;
					 i<=0;
					 ad2_ch7<=ad2_data;                        //读CH7
					 state<=REad2_ch8;				 
				 end
				 else begin
					 ad2_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  REad2_ch8: begin 
				 if(i==3) begin
					 ad2_rd<=1'b1;
					 i<=0;
					 ad2_ch8<=ad2_data;                        //读CH8
					 state<=READ_DONE;				 
				 end
				 else begin
					 ad2_rd<=1'b0;	
					 i<=i+1'b1;
				 end
		  end
		  
		  
		  READ_DONE:begin
					 ad2_rd<=1'b1;	 
					 ad2_cs<=1'b1;
					 state<=ENABLE_W;
					 wr2_en<=0;
		  end		
		  
		  ENABLE_W:begin
					 wr2_en<=1;
					 state<=CLOSE_W;
		  end	

		  CLOSE_W:begin
					 wr2_en<=0;
					 state<=IDLE;
		  end			  
		  
		  
		  default:	state<=IDLE;
		  endcase	
      
	end			 
 end

endmodule
