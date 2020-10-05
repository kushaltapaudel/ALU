`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: synchronizer
// By Kushalta Paudel
//////////////////////////////////////////////////////////////////////////////////

module edge_to_pulse (
    input clk_in,
    input [3:0] sw, pb,
	output reg signal_run
    );   

	reg signal_d, Out, fall;
	
// Initialization
initial
    begin
        signal_d = 1'b0;
		Out = 1'b0;
		signal_run = 1'b0;
        fall = 1'b0;
    end

	
always @(posedge clk_in)
	if(pb[0])
		begin
			Out <= 1'b0;
			signal_d <= 1'b0;
			signal_run <= 1'b0;
			fall <= 1'b0;
		end
	else
		begin
		  
			signal_d <= sw[0] | sw[1] | sw[2] | sw[3] | pb[1] | pb[2] | pb[3];
			Out <= signal_d;
			fall = Out & (!signal_d);
		    signal_run = (!Out) & signal_d;
		end	

endmodule  