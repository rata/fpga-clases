`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:54:06 08/29/2014 
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
    output sum0,
    output sum1,
    output sum2,
//    output sum3,
    output sum4,
    output [3:0] an,
    output [7:0] seg
    );

	 
wire reset, max_tick, clk_div;
wire [2:0] c_reg, d_reg;

assign reset = btn;

contador_n #(.N(26)) c1 (.clk(clk), .reset(reset), .max_tick(clk_div), .q(d_reg));
contador_n #(.N(3)) c2 (.clk(clk_div), .reset(reset), .max_tick(max_tick), .q(c_reg));

wire [7:0] in_sseg, in_sseg2;
hex_to_sseg h2s (.hex({1'b0, c_reg}), .dp(1'b0), .sseg(in_sseg));
hex_to_sseg h2s2 (.hex({1'b0, d_reg}), .dp(1'b0), .sseg(in_sseg2));
disp_mux disp_m (.clk(clk), .reset(1'b0), .in0(in_sseg), .in1(in_sseg2), .in2(8'hFF), .in3(8'hFF), .an(an), .sseg(seg));

assign sum0 = c_reg[0];
assign sum1 = c_reg[1];
assign sum2 = c_reg[2];
//assign sum3 = c_reg[3];
assign sum4 = clk_div;


endmodule
