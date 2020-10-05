`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: tb_nbit_adder
//////////////////////////////////////////////////////////////////////////////////


module tb_nbit_adder;

	parameter Width = 8;
    parameter PERIOD = 10;
	reg [Width - 1:0] tb_A, tb_B;
    reg tb_Cin;
    wire [Width - 1:0] tb_Sum;
    wire tb_Cout;
	integer i,j, k;

    nbit_adder #(Width) uut (.A(tb_A), .B(tb_B), .Cin(tb_Cin), .Sum(tb_Sum), .Cout(tb_Cout));
	
	initial begin
		tb_Cin = 0;
		tb_A = 0;
		tb_B = 0;
		for (i = 0; i < 2; i = i + 1) begin
			tb_Cin = i;
			for (j = 0; j < (2 ** Width); j = j + 1) begin
				tb_A = j;
				for (k = 0; k < (2 ** Width); k = k + 1) begin
					tb_B = k;
					# PERIOD;
				end 
			end 
		end 
		# (PERIOD * 5) $stop;
	end
		
endmodule