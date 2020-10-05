`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:twos_com
//////////////////////////////////////////////////////////////////////////////////


module twos_com #(parameter WIDTH = 5) (A, com);
    input [WIDTH-1:0] A; 
	output [WIDTH-1:0] com;

//		reg [WIDTH-1:0] i;
       
//		always @ (A) begin 
            
//			for (i = 0; A[i] != 1 & i < WIDTH - 1; i = i + 1) begin           
//				com[i] <= A[i];
//			end
//			com[i] <= A[i];

//			for (i = i + 1; i < WIDTH; i = i + 1) begin
//				com[i] <= ~A[i];
//			end
//        end

//		genvar i;
//        reg [WIDTH-1:0] Acopy;
        
//           generate
//            for (i = 0; A[i] != 1 & i < WIDTH - 1; i = i + 1) begin           
//				assign com[i] = A[i];
//			end
//			assign com[i] = A[i];

//			for (i = i + 1; i < WIDTH; i = i + 1) begin
//				assign com[i] = ~A[i];
//			end
//           endgenerate
        
          wire [WIDTH-3:0]mid;

    genvar i;

    assign com[0] = A[0];                      // Set the First Output bit
    assign com[1] = A[0] ^ A[1];              // Set the Second Output bit
    assign mid[0] = A[0] | com[1];             // Set the first mid comparison bit
    
    for ( i=0 ; i<WIDTH-2 ; i=i+1 )             // For-Loop to iterate through the rest of the bits to invert when necessary
        begin
        assign com[i+2] = A[i+2] ^ mid[i];     // Assign Output bits
        assign mid[i+1] = mid[i] | com[i+2];    // Assign intermediate comparison values
        end

        
endmodule


