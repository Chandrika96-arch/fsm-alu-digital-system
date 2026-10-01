`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 09:37:38 PM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(
    input logic [3:0] a,
    input logic [3:0] b,
    input logic [1:0] op,
    output logic [3:0] result
    );
    
    always_comb begin
      
      case (op)
        
        2'b00: result = a + b; 
        2'b01: result = a - b;
        2'b10: result = a & b;
        2'b11: result = a | b;
        
        default: result = 4'b0000;
       
       endcase
     
     end
     
endmodule
