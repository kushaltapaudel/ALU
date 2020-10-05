`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:overflow_mux
// By Kushalta Paudel
// 
//////////////////////////////////////////////////////////////////////////////////

module overflow_mux (Out, Sel, AddIn, SubIn); 

	//The two 2-bit input of the Mux
	input  AddIn, SubIn;
	input [2:0] Sel; //The selection line 
	output reg Out; //The single 2-bit output line of the Mux 


	//This always statement check the state of the input lines 
	always @ (AddIn or SubIn or Sel) begin 
		case (Sel) 
			3'b000 : Out = AddIn; 
			3'b001 : Out = SubIn; 
			default : Out = 1'b0; 
			//If input is undefined then output is undefined 
		endcase 
	end  

endmodule