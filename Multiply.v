`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 01:00:13 PM
// Design Name: 
// Module Name: Multiplier
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


module Multiply (
    input [3:0] operand1,    // 8-bit operand 1
    input [3:0] operand2,    // 8-bit operand 2
    output [7:0] product    // 16-bit product
);
    assign product = operand1 * operand2;  // Multiply two operands

endmodule

