`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:alu
//////////////////////////////////////////////////////////////////////////////////

module alu #(parameter WIDTH=4) (A, B, Sel, Overout, Rout);
	input [WIDTH-1:0] A, B;
	input [2:0] Sel;
	output Overout;
	output [WIDTH-1:0] Rout;
	
	reg carry = 1'b0;
	reg BIn = 1'b0;

	nbit_adder #(WIDTH) add (.A(A), .B(B), .Cin(carry), .Sum(funcmux.AddIn), .Cout(ovflomux.AddIn));
	nbit_sub #(WIDTH) sub (.A(A), .B(B), .Bin(BIn), .D(funcmux.SubIn), .Ovflow(ovflomux.SubIn));
	nbit_twos_com #(WIDTH) twos (.A(A), .Com(funcmux.TwoscomIn));
	nbit_and #(WIDTH) ands (.A(A), .B(B), .And(funcmux.AndIn));
    nbit_or #(WIDTH) ors(.A(A), .B(B), .Or(funcmux.OrIn));
    nbit_xor #(WIDTH) xors (.A(A), .B(B), .Xor(funcmux.XorIn));
    nbit_rot_left  #(WIDTH) left (.A(A), .Aout(funcmux.RlIn));
    nbit_rot_right #(WIDTH) right (.A(A), .Aout(funcmux.RrIn));

	func_mux #(WIDTH) funcmux (.Sel(Sel), .Out(Rout));
	overflow_mux ovflomux (.Out(Overout), .Sel(Sel)); 
	
endmodule