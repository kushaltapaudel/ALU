`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:nbit_rot_left
// By Kushalta Paudel
// 
//////////////////////////////////////////////////////////////////////////////////


module nbit_rot_left #(parameter WIDTH = 32) (A, Aout);
 // parameter is used with a default value of 32.

	input [WIDTH-1:0] A;
	output [WIDTH-1:0] Aout;

	genvar i;

	for (i = 0; i < WIDTH-1; i = i + 1) begin
		assign Aout[i] = A[i+1];
	end  
	assign Aout[WIDTH-1] = A[0];
endmodule