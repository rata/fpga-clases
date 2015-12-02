`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:22:39 09/05/2014 
// Design Name: 
// Module Name:    fsm_auto_in 
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
module fsm_auto_in(
    input clk,
	 input reset,
    input sen_a,
    input sen_b,
    output auto_in
    );
	 
// symbolic state declaration
localparam [2:0]
	s_0 = 4'b00_0,
	s_1 = 4'b01_0,
	s_2 = 4'b10_1,
	s_3 = 4'b11_1;

// signal declaration
reg [2:0] state_reg, s_next;

// state register
always @(posedge clk, posedge reset)
	if (reset)
		state_reg <= s_0;
	else
		state_reg <= s_next;

always @(state_reg, sen_a, sen_b)
begin
	s_next = state_reg;
	case (state_reg)
	s_0:
		if (sen_a && !sen_b)
			s_next = s_1;
	s_1:
		if (sen_a && !sen_b)
			s_next = s_1;
		else if (sen_a && sen_b)
			s_next = s_2;
		else
			s_next = s_0;
	s_2:
		if (sen_a && !sen_b)
			s_next = s_3;
	s_3:
		if (sen_a && !sen_b)
			s_next = s_3;
		else if (!sen_a && !sen_b)
			s_next = s_0;
		else
			s_next = s_2;
	default:
		s_next = state_reg;
	endcase
end

assign auto_in = state_reg[0];

endmodule