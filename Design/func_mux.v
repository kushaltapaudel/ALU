`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:func_mux
// By Kushalta Paudel
// 
//////////////////////////////////////////////////////////////////////////////////

module func_mux #(parameter WIDTH = 4) (Out, Sel, AddIn, SubIn, AndIn, TwoscomIn, OrIn,  XorIn, RlIn, RrIn); 

	//The eight 8-bit input of the Mux
	input [WIDTH-1:0]  AddIn, SubIn, AndIn, OrIn, XorIn, RlIn, RrIn, TwoscomIn;
	input [2:0] Sel; //The three bit selection line 
	output reg [WIDTH-1:0] Out; //The single 8-bit output line of the Mux 
	
	//This always statement check the state of the input lines 
	always @ (AddIn or SubIn or AndIn or OrIn or XorIn or RlIn or RrIn or TwoscomIn or Sel) begin 
		case (Sel) 
			3'b000 : Out = AddIn; 
			3'b001 : Out = SubIn; 
			3'b010 : Out = AndIn;
			3'b011 : Out = TwoscomIn; 
			3'b100 : Out = OrIn; 
			3'b101 : Out = XorIn; 
			3'b110 : Out = RlIn; 
			3'b111 : Out = RrIn; 
			default : Out = 8'bx; 
			//If input is undefined then output is undefined 

		endcase 
	end  

endmodule