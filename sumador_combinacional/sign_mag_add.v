`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:04:48 08/15/2014 
// Design Name: 
// Module Name:    sign_mag_add 
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
module sign_mag_add(
    input [3:0] a, b,
    output reg [3:0] sum
    );

	always @*
	begin
		// Resolvemos la siguiente cuenta:
		//	(+-) a (+-) b
		//
		// Para hacerlo, en todos los casos hacemos lo siguiente:
		// 1. Hacemos la suma/resta (usaria potencialmente los 4 bits de sum)
		// 2. Pisamos el 4to bit (carry) con el signo
		if (b[3]== 1 && a[3] == 0)
			begin
			// Si b > a, entonces es negativo el resultado
			if (b[2:0] > a[2:0])
				begin
				sum = b[2:0] - a[2:0];
				sum[3] = 1;
				end
			else
				begin
				sum = a[2:0] - b[2:0];
				sum[3] = 0;
				end
			end
		else if (b[3] == 0 && a[3] == 1)
			begin
			// Si b >= a, es positivo el resultado
			if (b[2:0] >= a[2:0])
				begin
				sum = b[2:0] - a[2:0];
				sum[3] = 0;
				end
			else
				begin
				sum = a[2:0] - b[2:0];
				sum[3] = 1;
				end
			end
		else
			begin
			// Este seria el caso que a[3] == b[3]
			sum = a[2:0] + b[2:0];
			sum[3] = a[3];

			end
	end

endmodule
