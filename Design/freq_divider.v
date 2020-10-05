`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: freq_divider
// By Kushalta Paudel
//////////////////////////////////////////////////////////////////////////////////

module freq_divider #(parameter Hz=50000) (
	input clk_in, 
	input rst,
	output reg OutClk
	);
	integer counter;
	//when 50000, once cycle = 1250
	//for simulation 
	parameter oneCycle = (125000000 / Hz) / 2;
	//parameter oneCycle = (125000000 / Hz) / 2;
	
initial
	begin
		counter <= 0;
		OutClk = 1'b0;
	end

always@(posedge clk_in or posedge rst) begin
	if (rst)
		begin
			counter <= 0;
			OutClk <= 1'b0;
		end
	
	else 
	    begin
            counter <= counter +1;
            if (counter >= oneCycle)
                begin
                    counter <= 0;
                    OutClk <= ~OutClk;
                end
        end  
end
endmodule
