`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 12:52:28 PM
// Design Name: 
// Module Name: ROM
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


module ROM (
    input [2:0] addr,          // 3-bit address for 8 locations
    output [3:0] data_out      // 4-bit output data
);
    reg [3:0] memory [7:0];    // 8x4 ROM, use reg since memory holds data

    // Initialize ROM with sample values
    initial begin
        memory[0] = 4'h1;
        memory[1] = 4'h2;
        memory[2] = 4'h3;
        memory[3] = 4'h4;
        memory[4] = 4'h5;
        memory[5] = 4'h6;
        memory[6] = 4'h7;
        memory[7] = 4'h8;
    end

    // Read-only output
    assign data_out = memory[addr];

endmodule

