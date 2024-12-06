`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 01:00:43 PM
// Design Name: 
// Module Name: Multiply_tb
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


module Multiplier_tb;
    reg [7:0] operand1, operand2;    // Use reg for operand1 and operand2
    wire [15:0] product;              // Use wire for product

    // Instantiate the Multiplier module
    Multiplier mul_inst (
        .operand1(operand1), 
        .operand2(operand2), 
        .product(product)
    );

    // Testbench stimulus
    initial begin
        $display("Starting Multiplier Testbench");

        // First test case: 5 * 4
        operand1 = 8'h05; // 5
        operand2 = 8'h04; // 4
        #10;
        $display("Operand1: %0d, Operand2: %0d, Product: %0d", operand1, operand2, product);

        // Second test case: 10 * 3
        operand1 = 8'h0A; // 10
        operand2 = 8'h03; // 3
        #10;
        $display("Operand1: %0d, Operand2: %0d, Product: %0d", operand1, operand2, product);

        // End simulation
        $stop;
    end
endmodule

