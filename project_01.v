`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:project_01
//////////////////////////////////////////////////////////////////////////////////

module project_01(
	input clk,
	input [3:0] pb, sw,
	output [3:0] led
);
	parameter Width = 4;
    wire divClk;        
    wire LowReset, enA, enB, OutEnbl;
    wire [3:0] aluA, aluB;
    wire [4:0] OutRegIn;
	
	reg rst;

	//alu
    alu #(Width) ALU (.A(aluA), .B(aluB), .Sel(sw[2:0]), .Overout(), .Result());

	// registers
	nbit_reg #(Width) REGA (.In(sw), .Clk(divClk), .En(enA), .Rst(rst), .Out(aluA));
	nbit_reg #(Width) REGB (.In(sw), .Clk(divClk), .En(enB), .Rst(rst), .Out(aluB));
	
	//led mux
	led_mux #(Width) LED (.Out(), .Sel(sw[3]), .FuncIn(), .OverflowIn());


	// frequency divider
	freq_divider FD (clk_in(clk), .rst(rst), .clk_50kHz(divClk));

	
	//out register
	
	
	//synchronizer
	
endmodule
