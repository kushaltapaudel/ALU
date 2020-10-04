`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: tb_nbit_twos_com
//////////////////////////////////////////////////////////////////////////////////


module tb_nbit_twos_com;

    parameter Width = 5;
    parameter PERIOD = 10;
	reg [Width - 1:0] tb_A; 
    wire [Width - 1:0] tb_Com;
	integer i;

    nbit_twos_com #(Width) uut (.A(tb_A), .Com(tb_Com));
	initial begin
		for (i = 0; i < (2 ** Width); i = i + 1) begin
			tb_A = i;
			# PERIOD;
		end 
		# (PERIOD * 5) $stop;
    end
		
endmodule
