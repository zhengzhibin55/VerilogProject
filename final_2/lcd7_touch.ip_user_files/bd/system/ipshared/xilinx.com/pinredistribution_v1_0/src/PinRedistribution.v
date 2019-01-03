`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/21 19:40:13
// Design Name: 
// Module Name: PinRedistribution
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


module PinRedistribution(
    input [23:0]vid_in,
    output [17:0]vid_data
    );
    
    assign vid_data[5:0] = vid_in[7:2];
    assign vid_data[11:6] = vid_in[15:10];
    assign vid_data[17:12] = vid_in[23:18];
    
endmodule
