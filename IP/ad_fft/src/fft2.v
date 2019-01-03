`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/10 10:56:58
// Design Name: 
// Module Name: fft
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

module fft2(
    input  clk,
    input reset,
    input [15:0 ]x1_re,
	input [15:0 ]x2_re,
	input [15:0 ]x3_re,
	input [15:0 ]x4_re,
	input [15:0 ]x5_re,
	input [15:0 ]x6_re,
	input [15:0 ]x7_re,
    input  start,     ////高电平期间输入的数值有效

	output  [31:0] re1_50,
    output  [31:0] im1_50,
	output  [31:0] re2_50,
    output  [31:0] im2_50,
	output  [31:0] re3_50,
    output  [31:0] im3_50,
	output  [31:0] re4_50,
    output  [31:0] im4_50,
	output  [31:0] re5_50,
    output  [31:0] im5_50,
	output  [31:0] re6_50,
    output  [31:0] im6_50,
	output [31:0] re7_50,
    output  [31:0] im7_50,
	output reg done

    );
///////////other singnals    
	reg [447 : 0] data_50;
	
    wire [15 : 0] xk_index;
    wire [223 : 0] s_axis_data_tdata;
    wire [447 : 0] m_axis_data_tdata;
    
 
    wire s_axis_data_tready;
    wire m_axis_data_tvalid;
      
	 /////////input////////  
	  
    assign s_axis_data_tdata={x1_re,16'h0000,x2_re,16'h0000,x3_re,16'h0000,x4_re,16'h0000,x5_re,16'h0000,x6_re,16'h0000,x7_re,16'h0000};
	
	///////output/////////////
	
    assign re1_50=data_50 [447:416];
    assign im1_50=data_50 [415:384]; 	
    assign re2_50=data_50 [383:352];
    assign im2_50=data_50 [351:320]; 	
    assign re3_50=data_50 [319:288];
    assign im3_50=data_50 [287:256]; 	
    assign re4_50=data_50 [255:224];
    assign im4_50=data_50 [223:192]; 	
    assign re5_50=data_50 [191:160];
    assign im5_50=data_50 [159:128]; 	
    assign re6_50=data_50 [127:96];
    assign im6_50=data_50 [95:64];    
    assign re7_50=data_50 [63:32];
    assign im7_50=data_50 [31:0]; 
	
    always @(posedge clk)
	begin
		if(~reset) begin
			data_50<=0;done<=0;
		end
		else begin
			if(xk_index==487&&m_axis_data_tvalid==1)	begin
				data_50<=m_axis_data_tdata;done<=1;
			end 
		
		end 
	end

///////////////////////  

xfft_2 f1 (
  .aclk(clk),                                                // input wire aclk
  .aresetn(reset),                                          // input wire aresetn
  .s_axis_config_tdata(56'h00000000000000),                  // input wire [55 : 0] s_axis_config_tdata
  .s_axis_config_tvalid(1'b1),                // input wire s_axis_config_tvalid
  //.s_axis_config_tready(s_axis_config_tready),                // output wire s_axis_config_tready
  .s_axis_data_tdata(s_axis_data_tdata),                      // input wire [223 : 0] s_axis_data_tdata
  .s_axis_data_tvalid(start),                    // input wire s_axis_data_tvalid
  .s_axis_data_tready(s_axis_data_tready),                    // output wire s_axis_data_tready
  .s_axis_data_tlast(1'b0),                      // input wire s_axis_data_tlast
  .m_axis_data_tdata(m_axis_data_tdata),                      // output wire [447 : 0] m_axis_data_tdata
  .m_axis_data_tuser(xk_index),                      // output wire [15 : 0] m_axis_data_tuser
  .m_axis_data_tvalid(m_axis_data_tvalid),                    // output wire m_axis_data_tvalid
  .m_axis_data_tready(1'b1)                    // input wire m_axis_data_tready
  //.m_axis_data_tlast(m_axis_data_tlast),                      // output wire m_axis_data_tlast
  //.event_frame_started(event_frame_started),                  // output wire event_frame_started
  //.event_tlast_unexpected(event_tlast_unexpected),            // output wire event_tlast_unexpected
  //.event_tlast_missing(event_tlast_missing),                  // output wire event_tlast_missing
  //.event_status_channel_halt(event_status_channel_halt),      // output wire event_status_channel_halt
  //.event_data_in_channel_halt(event_data_in_channel_halt),    // output wire event_data_in_channel_halt
  //.event_data_out_channel_halt(event_data_out_channel_halt)  // output wire event_data_out_channel_halt
);
    
    
    
endmodule

 