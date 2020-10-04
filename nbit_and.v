`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:nbit_and
// By Kushalta Paudel
// This is the bitwise AND module. It has input A and B and do AND operation.
//////////////////////////////////////////////////////////////////////////////////


module nbit_and #(parameter WIDTH = 32) (A, B, And);
 // parameter is used with a default value of 32.

	input [WIDTH-1:0] A, B;
	output [WIDTH-1:0] And;

	genvar i; /* the for index variable is declared as a genvar to be able to elaborate a for loop */

	for (i = 0; i < WIDTH; i = i + 1) begin
		assign And[i] = A[i] & B[i];
	end  
   
endmodule