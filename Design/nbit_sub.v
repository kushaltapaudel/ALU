`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: nbit_sub
//////////////////////////////////////////////////////////////////////////////////

module nbit_sub #(parameter WIDTH = 8) (A, B, Bin, D, Ovflow);
	// parameter is used with a default value of 32.

	input [WIDTH-1:0] A, B;
	input Bin; //Borrow in
	output [WIDTH-1:0] D;
	output Ovflow; 

	wire [WIDTH:0] Bout; //Borrow out
	wire [WIDTH-1:0] diff;
	genvar i; /* the for index variable is declared as a genvar to be able to elaborate a for loop */

	generate // generate for statement
		for (i = 0; i < WIDTH; i = i + 1)
			begin: sub_gen_block
			full_sub FS(.A(A[i]), .B(B[i]), .Bin(Bout[i]), .D(diff[i]), .Bout(Bout[i+1]));

		end
		nbit_twos_com #(WIDTH) uut (.A(diff), .Com(D));	
	endgenerate 

	// the following two continuous statements are for the initial carry input and the output overflow
	assign Bout[0] = Bin;
	assign Ovflow = Bout[WIDTH];
endmodule
