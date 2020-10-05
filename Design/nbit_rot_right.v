`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:nbit_rot_right
// By Kushalta Paudel
// 
//////////////////////////////////////////////////////////////////////////////////


module nbit_rot_right #(parameter WIDTH = 32) (A, Aout);
	// parameter is used with a default value of 32.

	input [WIDTH-1:0] A;
	output [WIDTH-1:0] Aout;

	genvar i; /* the for index variable is declared as a genvar to be able to elaborate a for loop */

  	for (i = WIDTH-1; i > 0; i = i - 1) begin
		assign Aout[i] = A[i-1];
	end  
		assign Aout[0] = A[WIDTH-1];
endmodule