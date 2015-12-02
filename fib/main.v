`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:18:17 09/05/2014 
// Design Name: 
// Module Name:    main 
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
module main(
	 input clk,
	 input btn,
    output [7:0] sseg,
    output [3:0] an
    );
	 
wire reset;
assign reset = btn;

wire [5:0] fib_ret;
fib_n #(.N(6)) ffib (.clk(clk), .reset(reset), .steps(6'd7), .fib_ret(fib_ret));

wire [3:0] byte1_nib1;
assign byte1_nib1 = fib_ret;

wire [3:0] byte1_nib2;
assign byte1_nib2 = (fib_ret >> 4);


wire [7:0] in_sseg_byte1_nib1;
wire [7:0] in_sseg_byte1_nib2;
hex_to_sseg h2s_1 (.hex(byte1_nib1), .dp(1'b1), .sseg(in_sseg_byte1_nib1));
hex_to_sseg h2s_2 (.hex(byte1_nib2), .dp(1'b1), .sseg(in_sseg_byte1_nib2));

disp_mux disp_m (.clk(clk), .reset(1'b0), .in0(in_sseg_byte1_nib1), .in1(in_sseg_byte1_nib2), .in2(8'hFF), .in3(8'hFF), .an(an), .sseg(sseg));

//hex_to_sseg h2s (.hex(fib_ret), .dp(1'b0), .sseg(in_sseg));
//disp_mux disp_m (.clk(clk), .reset(1'b0), .in0(in_sseg), .in1(8'hFF), .in2(8'hFF), .in3(8'hFF), .an(an), .sseg(sseg));


endmodule