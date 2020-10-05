`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:nbit_xor
// By Kushalta Paudel
// This is the bitwise XOR module. It has input A and B and do XOR operation.
//////////////////////////////////////////////////////////////////////////////////


module nbit_xor #(parameter WIDTH = 32) (A, B, Xor);
 // parameter is used with a default value of 32.

	input [WIDTH-1:0] A, B;
	output [WIDTH-1:0] Xor;

	genvar i; /* the for index variable is declared as a genvar to be able to elaborate a for loop */

	for (i = 0; i < WIDTH; i = i + 1) begin
		assign Xor[i] = A[i] ^ B[i];
	end  
endmodule