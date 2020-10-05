`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: nbit_sub
//////////////////////////////////////////////////////////////////////////////////

module nbit_adder #(parameter WIDTH = 32) (A, B, Cin, Sum, Cout);
	// parameter is used with a default value of 32.

	input [WIDTH-1:0] A, B;
	input Cin;
	output [WIDTH-1:0] Sum;
	output Cout;

	wire [WIDTH:0] carry;
	genvar i; /* the for index variable is declared as a genvar to be able to elaborate a for loop */

	generate // generate … for statement
		for (i = 0; i < WIDTH; i = i + 1) begin: adder_gen_block
			full_adder FA(.A(A[i]), .B(B[i]), .Cin(carry[i]), .Sum(Sum[i]), .Cout(carry[i+1]));
		end  
	endgenerate 

	// the following two continuous statements are for the initial carry input and the output overflow
	assign carry[0] = Cin;
	assign Cout = carry[WIDTH] ^ carry[WIDTH-1];
endmodule