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
	 input [1:0] sw,
    output [7:0] sseg,
    output [3:0] an,
    output led_in,
	 output led_a,
	 output led_b,
	 output led_edge
    );

wire sen_a, sen_b;
assign sen_a = sw[0];
assign sen_b = sw[1];

wire reset;
assign reset = btn;

wire auto_in;
fsm_auto_in a (.clk(clk), .reset(reset), .sen_a(sen_a), .sen_b(sen_b), .auto_in(auto_in));
wire auto_in_tick;
edge_detect edg_detect (.clk(clk), .reset(reset), .level(auto_in), .tick(auto_in_tick));
wire [3:0] autos_in_nr;
contador_digito #(.N(4)) counter (.clk(clk), .reset(reset), .soft_reset(1'b0), .prev_tick(auto_in_tick), .q(autos_in_nr));

assign led_in = auto_in;
assign led_a = sen_a;
assign led_b = sen_b;

wire [7:0] in_sseg;
hex_to_sseg h2s (.hex(autos_in_nr), .dp(1'b0), .sseg(in_sseg));
disp_mux disp_m (.clk(clk), .reset(1'b0), .in0(in_sseg), .in1(8'hFF), .in2(8'hFF), .in3(8'hFF), .an(an), .sseg(sseg));


endmodule