`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:50:35 05/14/2018
// Design Name:   top
// Module Name:   D:/FPGA/project/test/test.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;
	reg reset;
	reg ram_done;
	reg [31:0]doutb;
	// Outputs
	wire fft_reset;
	wire reset_done;
	wire [5:0] reset_i;
	wire [14:0] relay;

	// Instantiate the Unit Under Test (UUT)
	fft_reset1 uut (
		.clk(clk), 
		.reset(reset), 
		.doutb(doutb),
		.ram_done(ram_done), 
		.fft_reset(fft_reset), 
		.reset_done(reset_done), 
		.reset_i(reset_i), 
		.relay(relay)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		ram_done = 1;
		doutb=0;
		// Wait 100 ns for global reset to finish
		
		
		#100;
        reset=1;
        #100;
         doutb=32'h0f0f0f02;
           #5;
           doutb=32'h0;
         
		  #1500;
		   doutb=32'h0f0f0f01;
            #5;
            doutb=32'h0;
		   #1500;
		  
		  $stop;
		// Add stimulus here

	end
      always #1 clk=~clk;
endmodule

