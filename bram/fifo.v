`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:03:29 09/24/2014 
// Design Name: 
// Module Name:    fifo 
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

module reg_file
#(
	parameter B =8, // number of bits
		W =2 // number of address bits
	)
(
input wire clk,
input wire wr_en,
input wire [W-1:0] w_addr, r_addr,
input wire [B-1:0] w_data,
output wire [B-1:0] r_data
);
// signal declaration
reg [B-1:0] array_reg [2**W-1:0];
// body
// write operation
always @(posedge clk)
	if (wr_en)
		array_reg[w_addr] <= w_data;
// read operation
assign r_data = array_reg[r_addr];

endmodule

module fifo
#(
parameter B=8, // number of bits in a word
			 W=4  // number of address bits
)
(
input wire clk, reset,
input wire rd, wr,
input wire [B-1:0] w_data,
output wire empty, full,
output wire [B-1:0] r_data
);
//signal declaration
reg [B-1:0] array_reg [2**W-1:0]; // register array
reg [W-1:0] w_ptr_reg, w_ptr_next, w_ptr_succ;
reg [W-1:0] r_ptr_reg, r_ptr_next, r_ptr_succ;
reg full_reg, empty_reg, full_next, empty_next;
wire wr_en;


// body
// register file write operation
always @(posedge clk)
if (wr_en)
	array_reg[w_ptr_reg] <= w_data;
// register file read operation
assign r_data = array_reg[r_ptr_reg];
// write enabled only when FIFO is not full
assign wr_en = wr & ~full_reg;

// fifo control logic
// register for read and write pointers
always @(posedge clk, posedge reset)
if (reset)
	begin
		w_ptr_reg <=0;
		r_ptr_reg <=0;
		full_reg <=1'b0;
		empty_reg <=1'b1;
	end
else
	begin
		w_ptr_reg <= w_ptr_next;
		r_ptr_reg <= r_ptr_next;
		full_reg <= full_next;
		empty_reg <= empty_next;
	end

always @


// output
assign full = full_reg;
assign empty = empty_reg;


endmodule
