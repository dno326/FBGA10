`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 01:08:58 PM
// Design Name: 
// Module Name: TopModule_tb
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


module TopModule_tb;

// Inputs
reg clk;
reg reset;
reg [2:0] rom_addr1, rom_addr2;

// Outputs
wire [7:0] result;

// Instantiate the Unit Under Test (UUT)
TopModule uut (
    .clk(clk), 
    .reset(reset), 
    .rom_addr1(rom_addr1), 
    .rom_addr2(rom_addr2), 
    .result(result)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Testbench procedure
initial begin
    // Initialize inputs
    reset = 1;
    rom_addr1 = 3'b000;
    rom_addr2 = 3'b001;
    
    // Hold reset for a few clock cycles
    #20;
    reset = 0;
    
    // Test case 1: Simple multiplication
    #10;
    rom_addr1 = 3'b001; // Set ROM address for operand1
    rom_addr2 = 3'b010; // Set ROM address for operand2
    #20;
    
    // Test case 2: Change ROM addresses
    rom_addr1 = 3'b011;
    rom_addr2 = 3'b100;
    #20;
    
    // Test case 3: Check RAM writes
    rom_addr1 = 3'b101;
    rom_addr2 = 3'b110;
    #20;

    // Test case 4: Test reset functionality
    reset = 1; 
    #10;
    reset = 0; 
    rom_addr1 = 3'b111; 
    rom_addr2 = 3'b000;
    #20;
    
    // End of simulation
    $stop;
end

// Monitor values for debugging
initial begin
    $monitor("Time = %0d, Reset = %b, ROM Addr1 = %b, ROM Addr2 = %b, Result = %h",
             $time, reset, rom_addr1, rom_addr2, result);
end
endmodule
