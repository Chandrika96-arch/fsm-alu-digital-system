`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2026 09:38:32 PM
// Design Name: 
// Module Name: controller_fsm
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


module controller_fsm(
    input logic clk,
    input logic rst,
    input logic start,
    output logic load_a,
    output logic load_b,
    output logic done,
    output logic capture_result
    );
    typedef enum logic [1:0] {
        IDLE,
        LOAD_A,
        LOAD_B,
        EXECUTE
    } state_t;

    state_t current_state;
    state_t next_state;
    // State register
    always_ff @(posedge clk) begin
        if (rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end


    // Next-state logic + output logic
    always_comb begin

        // Defaults
        next_state = current_state;

        load_a = 0;
        load_b = 0;
        done   = 0;
        capture_result = 0;

        case (current_state)

            IDLE: begin
                if (start)
                    next_state = LOAD_A;
            end

            LOAD_A: begin
                load_a = 1;
                next_state = LOAD_B;
            end

            LOAD_B: begin
                load_b = 1;
                next_state = EXECUTE;
            end

            EXECUTE: begin
                capture_result = 1;
                done = 1;
                next_state = IDLE;
            end

            default: begin
                next_state = IDLE;
            end

        endcase

    end

endmodule
