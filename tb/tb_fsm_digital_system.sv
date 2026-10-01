`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2026 09:44:41 PM
// Design Name: 
// Module Name: tb_fsm_digital_system
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

module tb_fsm_digital_system;

    logic clk;
    logic rst;
    logic start;

    logic [3:0] input_a;
    logic [3:0] input_b;
    logic [1:0] op;

    logic [3:0] result;
    logic done;


    fsm_digital_system dut (
        .clk     (clk),
        .rst     (rst),
        .start   (start),
        .input_a (input_a),
        .input_b (input_b),
        .op      (op),
        .result  (result),
        .done    (done)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    initial begin

        rst     = 1;
        start   = 0;
        input_a = 0;
        input_b = 0;
        op      = 0;

        #10;
        rst = 0;


        // Test 5 + 3
        input_a = 4'd5;
        input_b = 4'd3;
        op      = 2'b00;

        start = 1;
        #10;
        start = 0;


        // Wait until FSM says operation is complete
        wait(done == 1);

        #1;

        if (result !== 4'd8)
            $error("FSM ADD FAILED");
        else
            $display("FSM ADD PASSED");


        #10;


        // Test 9 - 4
        input_a = 4'd9;
        input_b = 4'd4;
        op      = 2'b01;

        start = 1;
        #10;
        start = 0;

        wait(done == 1);

        #1;

        if (result !== 4'd5)
            $error("FSM SUBTRACT FAILED");
        else
            $display("FSM SUBTRACT PASSED");
            
       


        #10;
        
           // -------------------------
// Test 3: AND
// 12 = 1100
// 10 = 1010
// AND = 1000 = 8
// -------------------------

input_a = 4'd12;
input_b = 4'd10;
op      = 2'b10;

start = 1;
#10;
start = 0;

wait(done == 1);
#1;

if (result !== 4'd8)
    $error("FSM AND FAILED");
else
    $display("FSM AND PASSED");

#10;


// -------------------------
// Test 4: OR
// 9 = 1001
// 6 = 0110
// OR = 1111 = 15
// -------------------------

input_a = 4'd9;
input_b = 4'd6;
op      = 2'b11;

start = 1;
#10;
start = 0;

wait(done == 1);
#1;

if (result !== 4'd15)
    $error("FSM OR FAILED");
else
    $display("FSM OR PASSED");

#10;
        
        

        $display("FSM DIGITAL SYSTEM TEST COMPLETE");

        $finish;

    end

endmodule
