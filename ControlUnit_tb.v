`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 01:05:59 PM
// Design Name: 
// Module Name: ControlUnit_tb
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


module ControlUnit_tb;
    reg clk, start;                     // Define clock and start signals as reg
    wire read_rom, write_ram;           // Define read_rom and write_ram as wire
    wire [2:0] rom_addr, ram_addr;      // Define rom_addr and ram_addr as wire

    // Instantiate the ControlUnit
    ControlUnit cu_inst (
        .clk(clk),
        .start(start),
        .read_rom(read_rom),
        .write_ram(write_ram),
        .rom_addr(rom_addr),
        .ram_addr(ram_addr)
    );

    // Clock generation (10 ns period)
    always begin
        clk = 0; #5; clk = 1; #5; // 10 ns period clock
    end

    // Stimulus process
    initial begin
        // Display header
        $display("Starting ControlUnit Testbench");

        // Initialize inputs
        start = 0;  // Initially, start is 0 (IDLE state)
        #10;

        // Test 1: Start signal is asserted
        start = 1;  // Assert start
        #50;         // Wait for a few clock cycles to see state transitions

        // Test 2: Start signal is deasserted
        start = 0;  // Deassert start
        #50;         // Wait for the state machine to process

        // Test 3: Assert start again to see the control unit response
        start = 1;  // Assert start again
        #50;

        // Test 4: Assert start and then deassert after some cycles
        start = 0;  // Deassert start
        #50;

        // End simulation
        $stop;
    end

    // Display outputs at each time step
    initial begin
        $monitor("Time: %0t | read_rom: %b | write_ram: %b | rom_addr: %h | ram_addr: %h",
                 $time, read_rom, write_ram, rom_addr, ram_addr);
    end
endmodule

