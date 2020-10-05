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
	parameter Hz = 50000;
	wire [Width - 1: 0] regVal1, regVal2;
	wire [4:0] OutRegIn;
    wire divClk, run;
    reg rst, reg1,reg2,outreg;

	//alu
    alu #(Width) ALU (.A(regVal1), .B(regVal2), .Sel(sw[2:0]), .Overout(OutRegIn[4]), .Rout(OutRegIn[3:0]));
    //alu #(Width) ALU (.A(regVal1), .B(regVal2), .Sel(sw[2:0]), .Overout(OutRegIn[4]), .Rout(led));

	// registers
	nbit_reg #(Width) REGA (.In(sw), .Clk(divClk), .En(reg1), .Rst(rst), .Out(regVal1));
	nbit_reg #(Width) REGB (.In(sw), .Clk(divClk), .En(reg2), .Rst(rst), .Out(regVal2));
	
	out_reg #(Width  + 1) LEDOUT (.Clk(divClk), .En(outreg), .Rst(rst), .sw(sw[3]), .FullIn(OutRegIn), .Out(led)); //In defined in LED

	// frequency divider
	freq_divider #(Hz) FD (.clk_in(clk), .rst(rst), .OutClk(divClk));	
	//synchronizer
    edge_to_pulse Sync (.clk_in(divClk), .sw(sw), .pb(pb), .signal_run(run));
    always @ (posedge divClk) begin
        
        rst <= pb[0];
        reg1 <= pb[1];
        reg2 <= pb[2];
        outreg <= pb[3];
       // $display("sw=%b, pb=%b, regVal1=%b, regVal2=%b, OutRegIn=%b, led=%b, rst=%b, reg1=%b, reg2=%b",sw, pb, regVal1,regVal2, OutRegIn, led, rst, reg1, reg2);
    end	
endmodule
