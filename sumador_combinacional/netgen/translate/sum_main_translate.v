////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: sum_main_translate.v
// /___/   /\     Timestamp: Wed Aug 20 11:05:17 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/translate -ofmt verilog -sim sum_main.ngd sum_main_translate.v 
// Device	: 6slx16csg324-3
// Input file	: sum_main.ngd
// Output file	: /home/rcampos/fpga/sumador_combinacional/netgen/translate/sum_main_translate.v
// # of Modules	: 1
// Design Name	: sum_main
// Xilinx        : /opt/Xilinx/14.7/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module sum_main (
  a0, a1, a2, a3, b0, b1, b2, b3, sum0, sum1, sum2, sum3
);
  input a0;
  input a1;
  input a2;
  input a3;
  input b0;
  input b1;
  input b2;
  input b3;
  output sum0;
  output sum1;
  output sum2;
  output sum3;
  wire a0_IBUF_0;
  wire a1_IBUF_1;
  wire a2_IBUF_2;
  wire a3_IBUF_3;
  wire b0_IBUF_4;
  wire b1_IBUF_5;
  wire b2_IBUF_6;
  wire b3_IBUF_7;
  wire sum0_OBUF_8;
  wire sum1_OBUF_9;
  wire sum2_OBUF_10;
  wire \adder/Msub_GND_2_o_GND_2_o_sub_10_OUT<2:0>_lut<2> ;
  wire \adder/Msub_GND_2_o_GND_2_o_sub_10_OUT<2:0>_lut<0> ;
  wire \adder/a[2]_b[2]_LessThan_9_o ;
  wire \adder/Mmux_sum31 ;
  wire \adder/Mmux_sum32 ;
  wire \adder/Mmux_sum33_16 ;
  wire \adder/Mmux_sum34_17 ;
  wire \adder/Mmux_sum35 ;
  wire \adder/Mmux_sum36 ;
  wire \adder/Mmux_sum38 ;
  wire N2;
  wire N4;
  wire N5;
  X_LUT2 #(
    .INIT ( 4'h9 ))
  \adder/Msub_GND_2_o_GND_2_o_sub_10_OUT<2:0>_lut<2>1  (
    .ADR0(a1_IBUF_1),
    .ADR1(b1_IBUF_5),
    .O(\adder/Msub_GND_2_o_GND_2_o_sub_10_OUT<2:0>_lut<2> )
  );
  X_LUT2 #(
    .INIT ( 4'h9 ))
  \adder/Msub_GND_2_o_GND_2_o_sub_10_OUT<2:0>_lut<0>1  (
    .ADR0(a3_IBUF_3),
    .ADR1(b3_IBUF_7),
    .O(\adder/Msub_GND_2_o_GND_2_o_sub_10_OUT<2:0>_lut<0> )
  );
  X_LUT2 #(
    .INIT ( 4'h9 ))
  \adder/Mmux_sum311  (
    .ADR0(a0_IBUF_0),
    .ADR1(b0_IBUF_4),
    .O(\adder/Mmux_sum31 )
  );
  X_LUT3 #(
    .INIT ( 8'h18 ))
  \adder/Mmux_sum321  (
    .ADR0(a0_IBUF_0),
    .ADR1(\adder/a[2]_b[2]_LessThan_9_o ),
    .ADR2(b0_IBUF_4),
    .O(\adder/Mmux_sum32 )
  );
  X_LUT3 #(
    .INIT ( 8'h18 ))
  \adder/Mmux_sum331  (
    .ADR0(\adder/a[2]_b[2]_LessThan_9_o ),
    .ADR1(b0_IBUF_4),
    .ADR2(a0_IBUF_0),
    .O(\adder/Mmux_sum33_16 )
  );
  X_LUT6 #(
    .INIT ( 64'hF888FFFFF888F888 ))
  \adder/Mmux_sum351  (
    .ADR0(\adder/Mmux_sum33_16 ),
    .ADR1(b3_IBUF_7),
    .ADR2(\adder/Mmux_sum32 ),
    .ADR3(a3_IBUF_3),
    .ADR4(\adder/Mmux_sum31 ),
    .ADR5(\adder/Msub_GND_2_o_GND_2_o_sub_10_OUT<2:0>_lut<0> ),
    .O(\adder/Mmux_sum35 )
  );
  X_LUT6 #(
    .INIT ( 64'h4D44DD4D4D444D44 ))
  \adder/a[2]_b[2]_LessThan_9_o1  (
    .ADR0(a1_IBUF_1),
    .ADR1(b1_IBUF_5),
    .ADR2(a2_IBUF_2),
    .ADR3(b2_IBUF_6),
    .ADR4(a3_IBUF_3),
    .ADR5(b3_IBUF_7),
    .O(\adder/a[2]_b[2]_LessThan_9_o )
  );
  X_LUT5 #(
    .INIT ( 32'h00422466 ))
  \adder/Mmux_sum361  (
    .ADR0(a0_IBUF_0),
    .ADR1(b0_IBUF_4),
    .ADR2(\adder/a[2]_b[2]_LessThan_9_o ),
    .ADR3(b3_IBUF_7),
    .ADR4(a3_IBUF_3),
    .O(\adder/Mmux_sum36 )
  );
  X_BUF   a0_IBUF (
    .I(a0),
    .O(a0_IBUF_0)
  );
  X_BUF   a1_IBUF (
    .I(a1),
    .O(a1_IBUF_1)
  );
  X_BUF   a2_IBUF (
    .I(a2),
    .O(a2_IBUF_2)
  );
  X_BUF   a3_IBUF (
    .I(a3),
    .O(a3_IBUF_3)
  );
  X_BUF   b0_IBUF (
    .I(b0),
    .O(b0_IBUF_4)
  );
  X_BUF   b1_IBUF (
    .I(b1),
    .O(b1_IBUF_5)
  );
  X_BUF   b2_IBUF (
    .I(b2),
    .O(b2_IBUF_6)
  );
  X_BUF   b3_IBUF (
    .I(b3),
    .O(b3_IBUF_7)
  );
  X_LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFF2882 ))
  \adder/Mmux_sum34  (
    .ADR0(\adder/Mmux_sum31 ),
    .ADR1(a1_IBUF_1),
    .ADR2(\adder/Mmux_sum34_17 ),
    .ADR3(b1_IBUF_5),
    .ADR4(N2),
    .ADR5(\adder/Mmux_sum38 ),
    .O(sum2_OBUF_10)
  );
  X_LUT4 #(
    .INIT ( 16'h175F ))
  \adder/Mmux_sum341  (
    .ADR0(a2_IBUF_2),
    .ADR1(a3_IBUF_3),
    .ADR2(b2_IBUF_6),
    .ADR3(b3_IBUF_7),
    .O(\adder/Mmux_sum34_17 )
  );
  X_LUT6 #(
    .INIT ( 64'h0909990900009000 ))
  \adder/Mmux_sum34_SW0  (
    .ADR0(a2_IBUF_2),
    .ADR1(b2_IBUF_6),
    .ADR2(\adder/Msub_GND_2_o_GND_2_o_sub_10_OUT<2:0>_lut<2> ),
    .ADR3(\adder/Mmux_sum36 ),
    .ADR4(\adder/Msub_GND_2_o_GND_2_o_sub_10_OUT<2:0>_lut<0> ),
    .ADR5(\adder/Mmux_sum35 ),
    .O(N2)
  );
  X_LUT6 #(
    .INIT ( 64'h6462626420404020 ))
  \adder/Mmux_sum33  (
    .ADR0(a2_IBUF_2),
    .ADR1(b2_IBUF_6),
    .ADR2(\adder/Mmux_sum33_16 ),
    .ADR3(a1_IBUF_1),
    .ADR4(b1_IBUF_5),
    .ADR5(\adder/Mmux_sum32 ),
    .O(\adder/Mmux_sum38 )
  );
  X_LUT2 #(
    .INIT ( 4'h6 ))
  \adder/Mmux_sum11  (
    .ADR0(a3_IBUF_3),
    .ADR1(b3_IBUF_7),
    .O(sum0_OBUF_8)
  );
  X_MUX2   \adder/Mmux_sum2  (
    .IA(N4),
    .IB(N5),
    .SEL(\adder/Mmux_sum35 ),
    .O(sum1_OBUF_9)
  );
  X_LUT6 #(
    .INIT ( 64'h82EBEB2882282828 ))
  \adder/Mmux_sum2_F  (
    .ADR0(\adder/Mmux_sum31 ),
    .ADR1(a2_IBUF_2),
    .ADR2(b2_IBUF_6),
    .ADR3(a3_IBUF_3),
    .ADR4(b3_IBUF_7),
    .ADR5(\adder/Mmux_sum36 ),
    .O(N4)
  );
  X_LUT6 #(
    .INIT ( 64'hDA80FFFFFFFFDA80 ))
  \adder/Mmux_sum2_G  (
    .ADR0(a3_IBUF_3),
    .ADR1(\adder/Mmux_sum31 ),
    .ADR2(b3_IBUF_7),
    .ADR3(\adder/Mmux_sum36 ),
    .ADR4(a2_IBUF_2),
    .ADR5(b2_IBUF_6),
    .O(N5)
  );
  X_IPAD #(
    .LOC ( "T10" ))
  a0_29 (
    .PAD(a0)
  );
  X_IPAD #(
    .LOC ( "T9" ))
  a1_30 (
    .PAD(a1)
  );
  X_IPAD #(
    .LOC ( "V9" ))
  a2_31 (
    .PAD(a2)
  );
  X_IPAD #(
    .LOC ( "M8" ))
  a3_32 (
    .PAD(a3)
  );
  X_IPAD #(
    .LOC ( "N8" ))
  b0_33 (
    .PAD(b0)
  );
  X_IPAD #(
    .LOC ( "U8" ))
  b1_34 (
    .PAD(b1)
  );
  X_IPAD #(
    .LOC ( "V8" ))
  b2_35 (
    .PAD(b2)
  );
  X_IPAD #(
    .LOC ( "T5" ))
  b3_36 (
    .PAD(b3)
  );
  X_OPAD #(
    .LOC ( "U16" ))
  sum0_37 (
    .PAD(sum0)
  );
  X_OPAD #(
    .LOC ( "V16" ))
  sum1_38 (
    .PAD(sum1)
  );
  X_OPAD #(
    .LOC ( "U15" ))
  sum2_39 (
    .PAD(sum2)
  );
  X_OPAD #(
    .LOC ( "V15" ))
  sum3_40 (
    .PAD(sum3)
  );
  X_OBUF   sum0_OBUF (
    .I(sum0_OBUF_8),
    .O(sum0)
  );
  X_OBUF   sum1_OBUF (
    .I(sum1_OBUF_9),
    .O(sum1)
  );
  X_OBUF   sum2_OBUF (
    .I(sum2_OBUF_10),
    .O(sum2)
  );
  X_OBUF   sum3_OBUF (
    .I(a0_IBUF_0),
    .O(sum3)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

