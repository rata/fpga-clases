`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:04:00 08/29/2014
// Design Name:   main
// Module Name:   /home/rcampos/fpga/contador_bcd/test_main.v
// Project Name:  contador_bcd
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_main;

	// Inputs
	reg clk;
	reg btn;

	// Outputs
	wire sum0;
	wire sum1;
	wire sum2;
	wire sum3;
	wire sum4;
	wire [3:0] an;
	wire [7:0] seg;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.btn(btn), 
		.sum0(sum0), 
		.sum1(sum1), 
		.sum2(sum2), 
		//.sum3(sum3), 
		.sum4(sum4), 
		.an(an), 
		.seg(seg)
	);
	parameter T=20; // clock period

	always begin
		#(T/2)  clk = ~clk; // alterna el clock cada T/2 bases de tiempo
	end	initial begin
		// Initialize Inputs
		clk = 0;
		btn = 1;
		#T;
		btn = 0;
		// Wait 100 ns for global reset to finish
		#100;
		
		wait(sum2==1);
        
		// Add stimulus here

	end
      
endmodule

