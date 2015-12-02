`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:45:52 08/27/2014
// Design Name:   contador_n
// Module Name:   /home/rcampos/fpga/contador_bcd/test.v
// Project Name:  contador_bcd
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: contador_n
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;
	localparam T=20; // clock period
	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire max_tick;
	wire [7:0] q;

	// Instantiate the Unit Under Test (UUT)
	contador_n uut (
		.clk(clk), 
		.reset(reset), 
		.max_tick(max_tick), 
		.q(q)
	);

	always begin
		#(T/2)  clk = ~clk; // alterna el clock cada T/2 bases de tiempo
	end
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#10;
		wait(max_tick == 1);
      
		// Add stimulus here
		
		//#1000000000;


	end
      
endmodule

