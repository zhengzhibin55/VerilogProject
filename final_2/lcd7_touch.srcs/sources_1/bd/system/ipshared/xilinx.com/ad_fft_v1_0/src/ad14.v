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
	input [15:0] 		ad1_data,            //ad7606 采样数据
	input        		ad1_busy,            //ad7606 忙标志位 
	output    		   ad1_cs,              //ad7606 AD cs，与ad1_rd同为低电平是开始读
	output    		   ad1_rd,              //ad7606 AD data read，与ad1_cs同为低电平开始读
	output    	   	ad_reset,           //ad7606 AD reset
	output   		   ad_convstab,         //ad7606 AD convert start
	output [2:0] 		ad_os,              //ad7606 过采样倍率选择
	//ad2
	input [15:0] 		ad2_data,            //ad7606 采样数据
	input        		ad2_busy,            //ad7606 忙标志位 
	output    			ad2_cs,              //ad7606 AD cs，与ad2_rd同为低电平是开始读
	output    			ad2_rd,              //ad7606 AD data read，与ad2_cs同为低电平开始读
	/////////
	output   			wr1_en,                      //使能信号
	output   			[15:0] ad1_ch1,              //AD第1通道的数据
	output   			[15:0] ad1_ch2,              //AD第2通道的数据
	output   			[15:0] ad1_ch3,              //AD第3通道的数据
	output   			[15:0] ad1_ch4,              //AD第4通道的数据
	output   			[15:0] ad1_ch5,              //AD第5通道的数据
	output   			[15:0] ad1_ch6,              //AD第6通道的数据
	output   			[15:0] ad1_ch7,              //AD第7通道的数据
	output   			[15:0] ad1_ch8,               //AD第8通道的数据
	
    output   			wr2_en,                      //fifo使能信号
	output   			[15:0] ad2_ch1,              //AD第1通道的数据
	output   			[15:0] ad2_ch2,              //AD第2通道的数据
	output   			[15:0] ad2_ch3,              //AD第3通道的数据
	output   			[15:0] ad2_ch4,              //AD第4通道的数据
	output   			[15:0] ad2_ch5,              //AD第5通道的数据
	output   			[15:0] ad2_ch6,              //AD第6通道的数据
	output   			[15:0] ad2_ch7,              //AD第7通道的数据
	output   			[15:0] ad2_ch8               //AD第8通道的数据		
	
	
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
