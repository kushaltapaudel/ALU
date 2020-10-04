`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:twos_com
//////////////////////////////////////////////////////////////////////////////////

module nbit_twos_com #(parameter WIDTH = 5)(A, Com);
    input [WIDTH-1:0]A;
    output reg [WIDTH-1:0]Com;
    
    wire [WIDTH-1:0]signedcom;
    
    twos_com #(WIDTH) TC (.A(A), .com(signedcom));
    
    always @ (signedcom) begin
        if (A[WIDTH-1] == 0)
            Com = A;
        else        
            Com = signedcom;
    end
    
endmodule
