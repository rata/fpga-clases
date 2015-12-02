`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:25:04 10/01/2014
// Design Name:   asd
// Module Name:   /home/itirabasso/fifo/testing.v
// Project Name:  fifo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: asd
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testing;
	localparam T=20; // clock period
	// Inputs
	reg DO;
	reg DI;
	reg [5:0] RDADDR;
	reg RDCLK;
	reg REGCE;
	reg RST;
	reg WE;
	reg RDEN;
	reg [5:0] WRADDR;
	reg WRCLK;
	reg WREN;

	// Outputs
	wire a;
	reg clk;
	
	
	// Instantiate the Unit Under Test (UUT)
	asd uut (
		.a(a), 
		.DO(DO), 
		.DI(DI), 
		.RDADDR(6'b0), 
		.RDCLK(clk), 
		.REGCE(1'b0), 
		.RST(1'b0), 
		.WE(1'b0), 
		.RDEN(RDEN), 
		.WRADDR(1'b0), 
		.WRCLK(1'b0), 
		.WREN(1'b0)
	);
	
	always begin
		#(T/2)  clk = ~clk; // alterna el clock cada T/2 bases de tiempo
	end

	initial begin
		// Initialize Inputs
		DO = 0;
		DI = 0;
		RDADDR = 0;
		RDCLK = 0;
		REGCE = 0;
		RST = 0;
		WE = 0;
		RDEN = 0;
		WRADDR = 0;
		WRCLK = 0;
		WREN = 0;
		clk = 0;
		// Wait 100 ns for global reset to finish
		
		#T;
		
//		DI = 
        
		// Add stimulus here

	end
      
endmodule

