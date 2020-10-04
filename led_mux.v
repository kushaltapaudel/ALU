`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:led_mux
// By Kushalta Paudel
// 
//////////////////////////////////////////////////////////////////////////////////

module led_mux #(parameter WIDTH=4) (Out, Sel, FuncIn, OverflowIn); 

	input [WIDTH-1:0]  FuncIn, OverflowIn;
	input [2:0] Sel; //The selection line 
	output reg Out; //The single 2-bit output line of the Mux 


	//This always statement check the state of the input lines 
	always @ (FuncIn or OverflowIn or Sel) begin 
		case (Sel) 
			3'b000 : Out = FuncIn; 
			3'b001 : Out = OverflowIn; 
			default : Out = 4'bx; 
			//If input is undefined then output is undefined 
		endcase 
	end  



endmodule