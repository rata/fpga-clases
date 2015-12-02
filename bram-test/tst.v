`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:24:23 10/03/2014
// Design Name:   asd
// Module Name:   /home/rcampos/fpga/bram-test/tst.v
// Project Name:  bram-test
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

module tst;

	localparam T=20; // clock period

	// Inputs
	reg DI;
	reg [12:0] RDADDR;
	reg RDCLK;
	reg REGCE;
	reg RST;
	reg WE;
	reg RDEN;
	reg [12:0] WRADDR;
	reg WRCLK;
	reg WREN;

	// Outputs
	wire DO;

	// Instantiate the Unit Under Test (UUT)
	asd uut (
		.DO(DO), 
		.DI(DI), 
		.RDADDR(RDADDR), 
		.RDCLK(RDCLK), 
		.REGCE(REGCE), 
		.RST(RST), 
		.WE(WE), 
		.RDEN(RDEN), 
		.WRADDR(WRADDR), 
		.WRCLK(WRCLK), 
		.WREN(WREN)
	);
	
	always begin
		//#(T/2)  clk = ~clk; // alterna el clock cada T/2 bases de tiempo
		#(T/2) RDCLK = ~RDCLK;
		#(T/2) WRCLK = ~WRCLK;

	end
	initial begin
		// Initialize Inputs
		DI = 0;
		RDADDR = 1'h1;
		RDCLK = 0;
		REGCE = 1;
		RST = 0;
		WE = 0;
		RDEN = 1;
		WRADDR = 0;
		WRCLK = 0;
		WREN = 0;

		// Wait 100 ns for global reset to finish
		//#T;
		
		// Wait
		#300;
		
		RDADDR = 10'h2;

		// Wait 20*5
		#100;
		
		RDADDR = 10'h0;

		// Wait 20*5
		#300;
		
		// Probemos escribir un 0!
		RDEN = 0;
		WREN = 1;
		WE = 1;
		WRADDR = 10'h0;
		DI = 0;
		
		#300;
		
		// Leer lo que escribimos ?
		RDEN = 1;
		WREN = 0;
		WE = 0;

		#300;

		
	end
      
endmodule

