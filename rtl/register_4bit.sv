`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 12:23:26 AM
// Design Name: 
// Module Name: register_4bit
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


module register_4bit(
    input logic clk,
    input logic rst,
    input logic load,
    input logic [3:0]data_in,
    output logic [3:0]data_out
    );
    
    always_ff@(posedge clk)begin
    
    if (rst)
       data_out <= 4'b0000;
    else if (load)
       data_out <= data_in;
    
    end
    
endmodule
