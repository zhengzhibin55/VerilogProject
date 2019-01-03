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
module ad14(
   input        		clk,                  //50mhz
	
	//ad1
	input [15:0] 		ad1_data,            //ad7606 ��������
	input        		ad1_busy,            //ad7606 æ��־λ 
	output    		   ad1_cs,              //ad7606 AD cs����ad1_rdͬΪ�͵�ƽ�ǿ�ʼ��
	output    		   ad1_rd,              //ad7606 AD data read����ad1_csͬΪ�͵�ƽ��ʼ��
	output    	   	ad_reset,           //ad7606 AD reset
	output   		   ad_convstab,         //ad7606 AD convert start
	output [2:0] 		ad_os,              //ad7606 ����������ѡ��
	//ad2
	input [15:0] 		ad2_data,            //ad7606 ��������
	input        		ad2_busy,            //ad7606 æ��־λ 
	output    			ad2_cs,              //ad7606 AD cs����ad2_rdͬΪ�͵�ƽ�ǿ�ʼ��
	output    			ad2_rd,              //ad7606 AD data read����ad2_csͬΪ�͵�ƽ��ʼ��
	/////////
	output   			wr1_en,                      //ʹ���ź�
	output   			[15:0] ad1_ch1,              //AD��1ͨ��������
	output   			[15:0] ad1_ch2,              //AD��2ͨ��������
	output   			[15:0] ad1_ch3,              //AD��3ͨ��������
	output   			[15:0] ad1_ch4,              //AD��4ͨ��������
	output   			[15:0] ad1_ch5,              //AD��5ͨ��������
	output   			[15:0] ad1_ch6,              //AD��6ͨ��������
	output   			[15:0] ad1_ch7,              //AD��7ͨ��������
	output   			[15:0] ad1_ch8,               //AD��8ͨ��������
	
    output   			wr2_en,                      //fifoʹ���ź�
	output   			[15:0] ad2_ch1,              //AD��1ͨ��������
	output   			[15:0] ad2_ch2,              //AD��2ͨ��������
	output   			[15:0] ad2_ch3,              //AD��3ͨ��������
	output   			[15:0] ad2_ch4,              //AD��4ͨ��������
	output   			[15:0] ad2_ch5,              //AD��5ͨ��������
	output   			[15:0] ad2_ch6,              //AD��6ͨ��������
	output   			[15:0] ad2_ch7,              //AD��7ͨ��������
	output   			[15:0] ad2_ch8               //AD��8ͨ��������		
	
	
    );	

 ///////////ad1////////////
 wire ad_start;
 

 

//////////////////////////////
ad1 f1 (
    .clk(clk), 
    .ad1_data(ad1_data), 
    .ad1_busy(ad1_busy), 
    .ad1_cs(ad1_cs), 
    .ad1_rd(ad1_rd), 
    .ad_reset(ad_reset), 
    .ad_convstab(ad_convstab),
    .ad_os(ad_os), 
    .ad_start(ad_start), 
    .wr1_en(wr1_en), 
    .ad1_ch1(ad1_ch1), 
    .ad1_ch2(ad1_ch2), 
    .ad1_ch3(ad1_ch3), 
    .ad1_ch4(ad1_ch4), 
    .ad1_ch5(ad1_ch5), 
    .ad1_ch6(ad1_ch6), 
    .ad1_ch7(ad1_ch7), 
    .ad1_ch8(ad1_ch8)
    );

ad2 f2 (
    .clk(clk), 
    .ad2_data(ad2_data), 
    .ad2_busy(ad2_busy), 
    .ad2_cs(ad2_cs), 
    .ad2_rd(ad2_rd), 
    .ad_reset(ad_reset), 
    .ad_start(ad_start), 
    .wr2_en(wr2_en), 
    .ad2_ch1(ad2_ch1), 
    .ad2_ch2(ad2_ch2), 
    .ad2_ch3(ad2_ch3), 
    .ad2_ch4(ad2_ch4), 
    .ad2_ch5(ad2_ch5), 
    .ad2_ch6(ad2_ch6), 
    .ad2_ch7(ad2_ch7), 
    .ad2_ch8(ad2_ch8)
    );	 	  
    

	
     
    
    
    
    
    
    
    
//////////////////////////////debug//////////////





endmodule
