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
	
	input [15:0] 		ad1_data,            //ad7606 ��������
	input        		ad1_busy,            //ad7606 æ��־λ 
	output reg   		ad1_cs,              //ad7606 AD cs����ad1_rdͬΪ�͵�ƽ�ǿ�ʼ��
	output reg   		ad1_rd,              //ad7606 AD data read����ad1_csͬΪ�͵�ƽ��ʼ��
	output reg   		ad_reset,           	//ad7606 AD reset
	output reg   		ad_convstab,         //ad7606 AD convert start
	output [2:0] 		ad_os,              //ad7606 ����������ѡ��
	
	output reg 			ad_start,
   output reg 			wr1_en,                      //fifoʹ���ź�
	output reg 			[15:0] ad1_ch1,              //AD��1ͨ��������
	output reg 			[15:0] ad1_ch2,              //AD��2ͨ��������
	output reg 			[15:0] ad1_ch3,              //AD��3ͨ��������
	output reg 			[15:0] ad1_ch4,              //AD��4ͨ��������
	output reg 			[15:0] ad1_ch5,              //AD��5ͨ��������
	output reg 			[15:0] ad1_ch6,              //AD��6ͨ��������
	output reg 			[15:0] ad1_ch7,              //AD��7ͨ��������
	output reg 			[15:0] ad1_ch8               //AD��8ͨ��������
   
    );

reg [31:0]  cnt;
reg [30:0]  cnt2;
reg [5:0] i;
reg [3:0] state;



 //reg wr1_en;                      //fifoʹ���ź�
 //reg [15:0] ad1_ch1;              //AD��1ͨ��������
 //reg [15:0] ad1_ch2;              //AD��2ͨ��������
 //reg [15:0] ad1_ch3;              //AD��3ͨ��������
 //reg [15:0] ad1_ch4;              //AD��4ͨ��������
 //reg [15:0] ad1_ch5;              //AD��5ͨ��������
 //reg [15:0] ad1_ch6;              //AD��6ͨ��������
 //reg [15:0] ad1_ch7;             //AD��7ͨ��������
 //reg [15:0] ad1_ch8;               //AD��8ͨ��������	






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

assign ad_os=3'b110;    //��ʹ�ù�����
//AD ��λ��· 
always@(posedge clk)
 begin
 if(cnt<32'd125_000_00) begin
        cnt<=cnt+1;
        ad_reset<=1'b1;
      end
      else
        ad_reset<=1'b0;       
   end

//125MMʱ���£�ÿ��122070ʱ�ӽ���AD�������Ƶ��΢1024hz.
//100MMʱ���£�ÿ��97656ʱ�ӽ���AD�������Ƶ��΢1024hz.
//150MMʱ���£�ÿ��146484ʱ�ӽ���AD�������Ƶ��΢1024hz.
always@(posedge clk)
 begin
    if(cnt2==31'd97655) begin    
        cnt2<=0;           //100MMʱ���£�ÿ��97656ʱ�ӽ���AD�������Ƶ��΢1024hz.
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
				 if(i==2) begin                        //�ȴ�2��clock
					 i<=0;			 
					 state<=Wait_1;
					 ad_convstab<=1'b1;       				 
				 end
				 else begin
					 i<=i+1'b1;
					 ad_convstab<=1'b0;                     //����ADת��
				 end
		  end
		  Wait_1: begin            
				 if(i==5) begin                           //�ȴ�5��clock, �ȴ�busy�ź�Ϊ��
					 i<=0;
					 state<=Wait_busy;
				 end
				 else 
					 i<=i+1'b1;
		  end		 
		  Wait_busy: begin            
				 if(ad1_busy==1'b0) begin                    //�ȴ�busy�ź�Ϊ��
					 i<=0;			 
					 state<=REad1_ch1;
				 end
		  end
		  REad1_ch1: begin 
				 ad1_cs<=1'b0;                              //cs�ź���Ч	  
				 if(i==3) begin
					 ad1_rd<=1'b1;
					 i<=0;
					 ad1_ch1<=ad1_data;                        //��CH1
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
					 ad1_ch2<=ad1_data;                        //��CH2
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
					 ad1_ch3<=ad1_data;                        //��CH3
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
					 ad1_ch4<=ad1_data;                        //��CH4
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
					 ad1_ch5<=ad1_data;                        //��CH5
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
					 ad1_ch6<=ad1_data;                        //��CH6
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
					 ad1_ch7<=ad1_data;                        //��CH7
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
					 ad1_ch8<=ad1_data;                        //��CH8
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
