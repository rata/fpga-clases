`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:22:39 09/05/2014 
// Design Name: 
// Module Name:    fib_n
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
module fib_n
	#(parameter N=4)
	(
	 input clk,
	 input reset,
    input [N-1:0] steps,
    output [N-1:0] fib_ret
    );
	 
// symbolic state declaration
localparam 
	s_0 = 1'b0,
	s_1 = 1'b1;

// signal declaration
reg state_reg, s_next;
reg [N-1:0] a, b, a_next, b_next, res, step_reg, step_next;

// state register
always @(posedge clk, posedge reset)
begin
	if (reset)
		begin
		state_reg <= s_0;
		step_reg <= steps;
		a <= 1'b1;
		b <= 1'b0;
		end
	else
		begin
		state_reg <= s_next;
		step_reg <= step_next;
		a <= a_next;
		b <= b_next;
		end
end

//always @(state_reg, a, b, res, step_reg)
always @*
//always @(posedge clk, posedge reset)
begin
	s_next = state_reg;
	step_next = step_reg;
	b_next = b;
	a_next = a;
	
	res = a + b;
	if (step_reg != 0)
	begin
		step_next = step_reg - 1'b1;

		case (state_reg)
		s_0:
			begin
			b_next = res;
			s_next = s_1;
			end
		s_1:
			begin
			a_next = res;
			s_next = s_0;
			end
		endcase
	end
end

assign fib_ret = (step_reg==0)? res : 1'b0;

endmodule