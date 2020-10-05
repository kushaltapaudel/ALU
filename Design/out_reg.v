`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: out_reg
// By Kushalta Paudel
//////////////////////////////////////////////////////////////////////////////////

module out_reg #(parameter WIDTH=5) (
    input Clk, En, Rst, sw,
    input [WIDTH - 1:0] FullIn, 
	output reg [WIDTH - 2:0] Out
    );
    wire [WIDTH - 1:0] MuxOut;
    reg swEbl;
    
    led_mux #(WIDTH - 1) LED (.Out(MuxOut), .Sel(sw), .OverflowIn(FullIn[4]), .FuncIn(FullIn[3:0]));
  	always @ (posedge Clk or negedge Rst) begin
		if (Rst)
			Out <= 0;
		else if (En)
		    Out <= MuxOut;
	end

endmodule  