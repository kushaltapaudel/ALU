`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: synchronizer
// By Kushalta Paudel
//////////////////////////////////////////////////////////////////////////////////

module synchronizer (
    input clk_in, rst, signal_in,
    output reg fall,
	output reg rise,
	output reg signal_out
    );   

	reg signal_d;
	
// Initialization
initial
    begin
        signal_d = 1'b0;
		signal_out = 1'b0;
        rise = 1'b0;
        fall = 1'b0;
    end

	
always @(posedge clk_in)
	if(rst)
		begin
			signal_out <= 1'b0;
			signal_d <= 1'b0;
			rise <= 1'b0;
			fall <= 1'b0;
		end
	else
		begin
			signal_d <= signal_in;
			signal_out <= signal_d;
			fall = signal_out & (!signal_d);
		    rise = (!signal_out) & signal_d;
		end	

endmodule  