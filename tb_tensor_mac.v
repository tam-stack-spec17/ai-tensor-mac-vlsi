`timescale 1ns / 1ps

module tb_tensor_mac;
    reg clk;
    reg reset;
    reg [7:0] weight;
    reg [7:0] activation;
    wire [15:0] accumulator;

    // Wire the test variables into your MAC engine pins
    tensor_mac uut (
        .clk(clk),
        .reset(reset),
        .weight(weight),
        .activation(activation),
        .accumulator(accumulator)
    );

    // Generate a 100MHz clock signal
    always #5 clk = ~clk;

    initial begin
        // Tell the terminal to print these variables every time they change
        $monitor("Time: %0t | Weight: %3d | Activation: %3d | Accumulator (Total): %4d", 
                 $time, weight, activation, accumulator);

        // Step 1: Initialize and reset
        clk = 0; reset = 1; weight = 0; activation = 0;
        
        // Wait 10ns, then turn off the reset
        #10 reset = 0;

        // Step 2: Feed AI Matrix Data on each clock cycle
        @(posedge clk); weight = 3;  activation = 4;   // 3 * 4 = 12
        @(posedge clk); weight = 5;  activation = 2;   // 12 + (5 * 2) = 22
        @(posedge clk); weight = 10; activation = 10;  // 22 + (10 * 10) = 122
        
        // Wait two cycles to see final result, then end simulation
        @(posedge clk);
        @(posedge clk);
        #10 $finish;
    end
endmodule
