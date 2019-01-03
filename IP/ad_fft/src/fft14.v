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


module fft14(

    input  clk,
    input fft_reset,
	//////////////f1///////
	input			[15:0] ad1_ch1,              //AD第1通道的数据
	input			[15:0] ad1_ch2,              //AD第2通道的数据
	input			[15:0] ad1_ch3,              //AD第3通道的数据
	input			[15:0] ad1_ch4,              //AD第4通道的数据
	input			[15:0] ad1_ch5,              //AD第5通道的数据
	input			[15:0] ad1_ch6,              //AD第6通道的数据
	input			[15:0] ad1_ch7,              //AD第7通道的数据
    input            wr1_en,     ////高电平期间输入的数值有效

	output          [31:0] u1_re,
    output          [31:0] u1_im,
	output		    [31:0] u2_re,
    output  		[31:0] u2_im,
	output  		[31:0] u3_re,
    output  		[31:0] u3_im,
	output  		[31:0] u4_re,
    output  		[31:0] u4_im,
	output  		[31:0] u5_re,
    output  		[31:0] u5_im,
	output  		[31:0] u6_re,
    output  		[31:0] u6_im,
	output 			[31:0] u7_re,
    output  		[31:0] u7_im,
	output			done1,
	
	/////////////////f2/////////////

	input			[15:0] ad2_ch1,              //AD第1通道的数据
	input			[15:0] ad2_ch2,              //AD第2通道的数据
	input			[15:0] ad2_ch3,              //AD第3通道的数据
	input			[15:0] ad2_ch4,              //AD第4通道的数据
	input			[15:0] ad2_ch5,              //AD第5通道的数据
	input			[15:0] ad2_ch6,              //AD第6通道的数据
	input			[15:0] ad2_ch7,              //AD第7通道的数据
    input            wr2_en,     ////高电平期间输入的数值有效

	output          [31:0] i1_re,
    output          [31:0] i1_im,
	output		    [31:0] i2_re,
    output  		[31:0] i2_im,
	output  		[31:0] i3_re,
    output  		[31:0] i3_im,
	output  		[31:0] i4_re,
    output  		[31:0] i4_im,
	output  		[31:0] i5_re,
    output  		[31:0] i5_im,
	output  		[31:0] i6_re,
    output  		[31:0] i6_im,
	output 			[31:0] i7_re,
    output  		[31:0] i7_im,
	output			done2
	
    );
	

    
 fft1 f1 (
       .clk(clk), 
       .reset(fft_reset), 
       .x1_re(ad1_ch1), 
       .x2_re(ad1_ch2), 
       .x3_re(ad1_ch3), 
       .x4_re(ad1_ch4), 
       .x5_re(ad1_ch5), 
       .x6_re(ad1_ch6), 
       .x7_re(ad1_ch7), 
       .start(wr1_en), 
       .re1_50(u1_re), 
       .im1_50(u1_im), 
       .re2_50(u2_re), 
       .im2_50(u2_im), 
       .re3_50(u3_re), 
       .im3_50(u3_im), 
       .re4_50(u4_re), 
       .im4_50(u4_im), 
       .re5_50(u5_re), 
       .im5_50(u5_im), 
       .re6_50(u6_re), 
       .im6_50(u6_im), 
       .re7_50(u7_re), 
       .im7_50(u7_im),
	   .done(done1)
       );    
       
          fft2 f2 (
        .clk(clk), 
        .reset(fft_reset), 
        .x1_re(ad2_ch1), 
        .x2_re(ad2_ch2), 
        .x3_re(ad2_ch3), 
        .x4_re(ad2_ch4), 
        .x5_re(ad2_ch5), 
        .x6_re(ad2_ch6), 
        .x7_re(ad2_ch7), 
        .start(wr2_en), 
        .re1_50(i1_re), 
        .im1_50(i1_im), 
        .re2_50(i2_re), 
        .im2_50(i2_im), 
        .re3_50(i3_re), 
        .im3_50(i3_im), 
        .re4_50(i4_re), 
        .im4_50(i4_im), 
        .re5_50(i5_re), 
        .im5_50(i5_im), 
        .re6_50(i6_re), 
        .im6_50(i6_im), 
        .re7_50(i7_re), 
        .im7_50(i7_im),
		.done(done2)
        );    
    
    
endmodule


