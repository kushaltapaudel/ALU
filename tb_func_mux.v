`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: tb_func_mux
//////////////////////////////////////////////////////////////////////////////////


module tb_func_mux;

	parameter Width = 3;
    parameter PERIOD = 10;
	wire [Width - 1:0] tb_AddIn, tb_SubIn, tb_AndIn, tb_TwoscomIn, tb_OrIn, tb_XorIn, tb_RlIn, tb_RrIn;
    reg [2:0] tb_Sel;
    wire [Width-1:0] tb_FuncOut;
    wire tb_OverOut;
	
	reg [Width-1:0] inval1;
	reg [Width-1:0] inval2;
	reg CIn, BIn;
	wire COut,Overflow;
	integer i , j, k;
	
    func_mux #(Width) uut (.AddIn(tb_AddIn), .SubIn(tb_SubIn), .AndIn(tb_AndIn), .OrIn(tb_OrIn), 
	.XorIn(tb_XorIn), .RlIn(tb_RlIn), .RrIn(tb_RrIn), .TwoscomIn(tb_TwoscomIn), .Sel(tb_Sel), .Out(tb_FuncOut));
	
	overflow_mux uut2 (.Out(tb_OverOut), .Sel(tb_Sel), .AddIn(COut), .SubIn(Overflow)); 
	
	nbit_adder #(Width) add (.A(inval1), .B(inval2), .Cin(CIn), .Sum(tb_AddIn), .Cout(COut));
    nbit_sub #(Width) sub (.A(inval1), .B(inval2), .Bin(BIn), .D(tb_SubIn), .Ovflow(Overflow));
    nbit_twos_com #(Width) twos (.A(inval1), .Com(tb_TwoscomIn));
    nbit_and #(Width) ands (.A(inval1), .B(inval2), .And(tb_AndIn));
    nbit_or #(Width) ors (.A(inval1), .B(inval2), .Or(tb_OrIn));
    nbit_xor #(Width) xors (.A(inval1), .B(inval2), .Xor(tb_XorIn));
    nbit_rot_left #(Width) left (.A(inval1), .Aout(tb_RlIn));
    nbit_rot_right #(Width) right (.A(inval1), .Aout(tb_RrIn));
        
	initial begin
		CIn = 0;
		BIn = 0;
		inval1 = 0;
		inval2 = 0;
		tb_Sel = 0;

		
        for (i = 0; i < 8; i = i + 1) begin
			tb_Sel = i;
			for (j = 0; j < (2 ** Width); j = j + 3) begin
				inval1 = j;
				for (k = 0; k < (2 ** Width); k = k + 4) begin
					inval2 = k;
					# PERIOD;
				end 
			end 
        end 
		# (PERIOD * 5) $stop;
	end
		
endmodule