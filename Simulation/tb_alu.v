`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: tb_alu
//////////////////////////////////////////////////////////////////////////////////


module tb_alu;

	parameter Width = 3;
    parameter PERIOD = 10;
    reg [2:0] tb_Sel;
    wire [Width-1:0] tb_FuncOut;
    wire tb_OverOut;
	
	reg [Width-1:0] inval1;
	reg [Width-1:0] inval2;
	integer i , j, k;
	
	alu #(Width) uut (.A(inval1), .B(inval2), .Sel(tb_Sel), .Overout(tb_OverOut), .Rout(tb_FuncOut));
	
	initial begin
		inval1 = 0;
		inval2 = 0;
		tb_Sel = 0;

		
        for (i = 0; i < 8; i = i + 1) begin
			tb_Sel = i;
			for (j = 0; j < (2 ** Width); j = j + 3) begin
				inval1 = j;
				for (k = 0; k < (2 ** Width); k = k + 4) begin
					inval2 = k;
					# PERIOD;
				end 
			end 
        end 
		# (PERIOD * 5) $stop;
	end
		
endmodule