`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: tb_nbit_sub
//////////////////////////////////////////////////////////////////////////////////


module tb_nbit_sub;

	parameter Width = 4;
    parameter PERIOD = 10;
	reg [Width - 1:0] tb_A, tb_B;
    reg tb_Bin;
    wire [Width - 1:0] tb_D;
    wire tb_Bout;
	integer i,j, k;

    nbit_sub #(Width) uut (.A(tb_A), .B(tb_B), .Bin(tb_Bin), .D(tb_D), .Ovflow(tb_Bout));
	initial begin
		tb_Bin = 0;
		tb_A = 0;
		tb_B = 0;
		for (i = 0; i < 2; i = i + 1) begin
			tb_Bin = i;
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