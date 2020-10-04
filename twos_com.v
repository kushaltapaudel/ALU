`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:twos_com
//////////////////////////////////////////////////////////////////////////////////


module twos_com #(parameter WIDTH = 5) (A, com);
    input [WIDTH-1:0] A; 
	output reg [WIDTH-1:0] com;

		reg [WIDTH-1:0] i;
       
		always @ (A) begin 
            
			for (i = 0; A[i] != 1 & i < WIDTH - 1; i = i + 1) begin           
				com[i] <= A[i];
			end
			com[i] <= A[i];

			for (i = i + 1; i < WIDTH; i = i + 1)begin
				com[i] <= ~A[i];
			end
        end

//    genvar i;
//    generate 
    
//           for (i = 0; A[i] != 1 & i < WIDTH - 1; i = i + 1) begin           
//                 assign com[i] = A[i];
//           end
//           assign com[i] = A[i];
           
//           for (i = i + 1; i < WIDTH; i = i + 1)begin
//                   assign com[i] = ~A[i];
//            end
//       for (i = 0; i < WIDTH; i = i + 1) begin
//            assign com[i] = ~A[i];
//        end
//    endgenerate
        
endmodule


