`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:42:18 09/10/2014 
// Design Name: 
// Module Name:    edge_detect 
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
module edge_detect
(
	input wire clk, reset,
	input wire level,
	output reg tick
);

// symbolic state declaration
localparam [1:0] zero = 2'b00,
						edg = 2'b01,
						one = 2'b10;

// signal declaration
reg [1:0] state_reg, state_next;

// state register
always @(posedge clk, posedge reset)
if (reset)
	state_reg <= zero;
else
	state_reg <= state_next;

// next state logic and output logic
//always @*
always @(state_reg, level)
begin
	state_next = state_reg; // default state: the same
	tick = 1'b0; // default output:0
	case (state_reg)
		zero:
			if (level)
				state_next = edg;
		edg:
			begin
				tick = 1'b1;
				if (level)
					state_next = one;
				else
					state_next = zero;
			end
		one:
			if (!level)
				state_next = zero;
		default:
			state_next = zero;	
	endcase
end

endmodule