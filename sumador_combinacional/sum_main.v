`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:15 08/20/2014 
// Design Name: 
// Module Name:    sum_main 
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
module sum_main(
	input a0,
	input a1,
	input a2,
	input a3,
	input b0,
	input b1,
	input b2,
	input b3,
	input [1:0] btn,
	input clk,
	output sum0,
	output sum1,
	output sum2,
	output sum3,
	output [7:0] seg,
	output [3:0] an
    );
	 
	wire [3:0] sum;
	wire [3:0] a;
	wire [3:0] b;
	reg [3:0] to_display;

	assign a = { a3, a2, a1, a0 };
	assign b = { b3, b2, b1, b0 };

	sign_mag_add adder (.a(a), .b(b), .sum(sum));
	
	assign sum0 = sum[0];
	assign sum1 = sum[1];
	assign sum2 = sum[2];
	assign sum3 = sum[3];
	
	always @*
	begin
		case(btn)
			2'b00: to_display = a;
			2'b01: to_display = b;
			default: to_display = sum;
		endcase
	end
	
	wire [7:0] in_sseg;
	hex_to_sseg h2s (.hex({1'b0, to_display[2:0]}), .dp(1'b0), .sseg(in_sseg));
	disp_mux disp_m (.clk(clk), .reset(1'b0), .in0(in_sseg), .in1({to_display[3], 7'b1111111}), .in2(8'b0), .in3(8'b0), .an(an), .sseg(seg));
	
endmodule
