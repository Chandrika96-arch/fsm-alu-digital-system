`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2026 09:42:31 PM
// Design Name: 
// Module Name: fsm_digital_system
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

module fsm_digital_system (
    input  logic       clk,
    input  logic       rst,
    input  logic       start,

    input  logic [3:0] input_a,
    input  logic [3:0] input_b,
    input  logic [1:0] op,

    output logic [3:0] result,
    output logic       done
);

    // Internal signals
    logic load_a;
    logic load_b;

    logic [3:0] reg_a;
    logic [3:0] reg_b;

    // NEW: internal ALU output
    logic [3:0] alu_result;

    // NEW: controller tells result register when to capture
    logic capture_result;


    // Controller FSM
    controller_fsm controller (
        .clk            (clk),
        .rst            (rst),
        .start          (start),
        .load_a         (load_a),
        .load_b         (load_b),
        .done           (done),
        .capture_result (capture_result)
    );


    // Register A
    register_4bit regA (
        .clk      (clk),
        .rst      (rst),
        .load     (load_a),
        .data_in  (input_a),
        .data_out (reg_a)
    );


    // Register B
    register_4bit regB (
        .clk      (clk),
        .rst      (rst),
        .load     (load_b),
        .data_in  (input_b),
        .data_out (reg_b)
    );


    // ALU
    alu alu_inst (
        .a      (reg_a),
        .b      (reg_b),
        .op     (op),
        .result (alu_result)
    );


    // NEW: Result register
    always_ff @(posedge clk) begin
        if (rst)
            result <= 4'b0000;
        else if (capture_result)
            result <= alu_result;
    end


endmodule