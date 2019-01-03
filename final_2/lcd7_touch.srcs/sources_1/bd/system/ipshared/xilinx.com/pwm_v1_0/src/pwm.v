`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/21 13:23:12
// Design Name: 
// Module Name: pwm
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


module pwm(
	input clk,
	input rst,
	output lcd_bl_pwm
    );
(*mark_debug = "true"*)reg[15:0] period_r;
(*mark_debug = "true"*)reg[15:0] duty_r;
(*mark_debug = "true"*)reg[15:0] period_cnt;
(*mark_debug = "true"*)reg pwm_r;
assign lcd_bl_pwm = pwm_r;
always@(posedge clk or posedge rst)
begin
	if(rst)
	begin
		period_r <= 16'd0;
		duty_r <= 16'd0;
	end
	else
	begin
		period_r <= 16'd1;
		duty_r   <= 16'h8000;
	end
end

always@(posedge clk or posedge rst)
begin
	if(rst)
		period_cnt <= 16'd0;
	else
		period_cnt <= period_cnt + period_r;
end

always@(posedge clk or posedge rst)
begin
	if(rst)
	begin
		pwm_r <= 1'b0;
	end
	else
	begin
		if(period_cnt >= duty_r)
			pwm_r <= 1'b1;
		else
			pwm_r <= 1'b0;
	end
end

endmodule
