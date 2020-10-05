`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: tb_project_01
//////////////////////////////////////////////////////////////////////////////////


module tb_project_01;
    parameter Width = 4;
    //125000000
    parameter ClkPeriod = 2;
    parameter PERIOD = (ClkPeriod * 5000);
    reg [3:0] tb_sw;
    reg [3:0] tb_pb;
    wire [3:0] tb_led;
    reg tb_Clk;
	integer i , j, k;
	
	project_01 uut (.clk(tb_Clk), .pb(tb_pb), .sw(tb_sw), .led(tb_led));
	
	initial begin
	   tb_Clk = 0;
	   tb_sw = 0;
	   tb_pb = 0;
	   
	    tb_pb[1] = 1;
        tb_sw = 5;
        #(PERIOD/2);
        tb_pb[1] = 0;
        #(PERIOD);
        tb_pb[2] = 1;
        tb_sw = 4;
        #(PERIOD/2);
        tb_pb[2] = 0;
        #(PERIOD);
        
       	for (k = 0; k < 2 ** (Width -1); k = k + 1) begin
	        tb_sw = k;
	        #(PERIOD * 2);
	        tb_pb[3] = 1;
	        #(PERIOD * 2);
	        tb_pb[3] = 0;
	        #(PERIOD * 2);
        end 
	end
    
    //clock
	always begin
        #(ClkPeriod / 2);
        tb_Clk = ~tb_Clk;
	end
	
	//stop switch
	always begin
	   #(PERIOD * 600);
	   $stop;
	end
	
	//reset switch every Period * 9
	initial begin
//	   tb_pb[0] = ~tb_pb[0];
//	   #(PERIOD * 5)
//	   tb_pb[0] = ~tb_pb[0];
	end
	
	//register A and B
	always begin
//        for (i = 0; i < (2 ** Width); i = i + 1) begin
//			tb_pb[1] = ~tb_pb[1];
//			tb_sw = i;
//			#(PERIOD / 2);
//			tb_pb[1] = ~tb_pb[1];
//			tb_sw = 0;
//			for (j = 0; j < (2 ** Width); j = j + 1) begin
//                tb_pb[2] = ~tb_pb[2];
//                tb_sw = j;
//                #(PERIOD / 2);
//                tb_pb[2] = ~tb_pb[2];
//                tb_sw = 0;
                #PERIOD;
//			end 
//        end
        
 
	end
	
//	//select func/overflow
//	always begin
//	   for (k = 0; k < 2 ** (Width -1); k = k + 1) begin
//	        tb_sw = k;
//	        #(PERIOD * 2);
//            tb_pb[3] = ~tb_pb[3];
//            tb_sw[3] = ~tb_sw[3];
//            #(PERIOD);
//            tb_pb[3] = ~tb_pb[3];
//            #(PERIOD * 2);    
//        end
//    end
            
            
            
                
            endmodule
