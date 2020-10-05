`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:nbit_reg
//////////////////////////////////////////////////////////////////////////////////

module nbit_reg #(parameter WIDTH=4)(Clk, En, Rst, In, Out);
    input Clk, En, Rst;
    input [WIDTH-1:0] In;
    output reg [WIDTH-1:0] Out;
  
    
	always @ (posedge Clk or posedge Rst) begin
		if (Rst)
			Out <= 0;
		else if (En)
			Out <= In;

	end
    
endmodule
