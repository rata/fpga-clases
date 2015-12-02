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
    output sum3,
    output sum4,
    output [3:0] an,
    output [7:0] seg
    );

	 
wire reset;

//assign soft_reset = 1'b0;
assign reset = btn;

//contador_n #(.N(26)) c1 (.clk(clk), .reset(reset), .max_tick(clk_div), .q(d_reg));
//contador_n #(.N(3)) c2 (.clk(clk_div), .reset(reset), .max_tick(max_tick), .q(c_reg));

//wire [7:0] in_sseg, in_sseg2;
//hex_to_sseg h2s (.hex({1'b0, c_reg}), .dp(1'b0), .sseg(in_sseg));
////hex_to_sseg h2s2 (.hex({1'b0, d_reg}), .dp(1'b0), .sseg(in_sseg2));
//disp_mux disp_m (.clk(clk), .reset(1'b0), .in0(in_sseg), .in1(8'hFF), .in2(8'hFF), .in3(8'hFF), .an(an), .sseg(seg));

//assign sum0 = c_reg[0];
//assign sum1 = c_reg[1];
//assign sum2 = c_reg[2];
////assign sum3 = c_reg[3];
//assign sum4 = clk_div;

wire max_tick_cseg;
wire [22:0] cseg_reg;
wire cseg_tick, cseg_soft_reset;
contador_n #(.N(23)) cseg (.clk(clk), .reset(reset), .soft_reset(soft_reset_cseg), .q(cseg_reg));
assign cseg_tick = (cseg_reg == 'd5000000)? 1'b1 : 1'b0;
assign soft_reset_cseg = (cseg_reg == 'd5000000)? 1'b1 : 1'b0;

wire [3:0] cseg1_reg;
wire cseg1_tick, cseg1_soft_reset;
contador_digito #(.N(4)) cseg1 (.clk(clk), .reset(reset), .soft_reset(cseg1_soft_reset), .prev_tick(cseg_tick), .q(cseg1_reg));
assign cseg1_tick = (cseg1_reg == 'd10)? 1'b1 : 1'b0;
assign cseg1_soft_reset = (cseg1_reg == 'd10)? 1'b1 : 1'b0;

wire [3:0] cseg2_reg;
wire cseg2_tick, cseg2_soft_reset;
contador_digito #(.N(4)) cseg2 (.clk(clk), .reset(reset), .soft_reset(cseg2_soft_reset), .prev_tick(cseg1_tick), .q(cseg2_reg));
assign cseg2_tick = (cseg2_reg == 'd10)? 1'b1 : 1'b0;
assign cseg2_soft_reset = (cseg2_reg == 'd10)? 1'b1 : 1'b0;

wire [3:0] cseg3_reg;
wire cseg3_tick, cseg3_soft_reset;
contador_digito #(.N(4)) cseg3 (.clk(clk), .reset(reset), .soft_reset(cseg3_soft_reset), .prev_tick(cseg2_tick), .q(cseg3_reg));
assign cseg3_tick = (cseg3_reg == 'd10)? 1'b1 : 1'b0;
assign cseg3_soft_reset = (cseg3_reg == 'd10)? 1'b1 : 1'b0;

wire [3:0] cseg4_reg;
wire cseg4_soft_reset;
contador_digito #(.N(4)) cseg4 (.clk(clk), .reset(reset), .soft_reset(cseg4_soft_reset), .prev_tick(cseg3_tick), .q(cseg4_reg));
assign cseg4_soft_reset = (cseg4_reg == 'd10)? 1'b1 : 1'b0;

wire [7:0] in_sseg_1;
wire [7:0] in_sseg_2;
wire [7:0] in_sseg_3;
wire [7:0] in_sseg_4;
hex_to_sseg h2s_1 (.hex(cseg1_reg), .dp(1'b0), .sseg(in_sseg_1));
hex_to_sseg h2s_2 (.hex(cseg2_reg), .dp(1'b0), .sseg(in_sseg_2));
hex_to_sseg h2s_3 (.hex(cseg3_reg), .dp(1'b0), .sseg(in_sseg_3));
hex_to_sseg h2s_4 (.hex(cseg4_reg), .dp(1'b0), .sseg(in_sseg_4));
disp_mux disp_m (.clk(clk), .reset(1'b0), .in0(in_sseg_1), .in1(in_sseg_2), .in2(in_sseg_3), .in3(in_sseg_4), .an(an), .sseg(seg));

assign sum0 = cseg1_reg[0];
assign sum1 = cseg1_reg[1];
assign sum2 = cseg1_reg[2];
assign sum3 = cseg1_reg[3];
assign sum4 = 1'b0;

endmodule
