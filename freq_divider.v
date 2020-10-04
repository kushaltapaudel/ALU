`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: freq_divider
// By Kushalta Paudel
//////////////////////////////////////////////////////////////////////////////////

module freq_divider(
	input clk_in, 
	input rst,
	output reg clk_50kHz
	);
	integer counter;
	
	//one cycle for 5 hz : (125000000/50000)/2 = 1250
	parameter oneCycle = 1250;
	
initial
	begin
		counter <= 0;
		clk_50kHz = 1'b0;
	end

always@(posedge clk_in or posedge rst) begin
	if (rst)
		begin
			counter <= 0;
			clk_50kHz <= 1'b0;
		end
	
	else 
	    begin
            counter <= counter +1;
            if (counter >= oneCycle)
                begin
                    counter <= 0;
                    clk_50kHz <= ~clk_50kHz;
                end
        end  
end
endmodule
