`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 12:47:33 PM
// Design Name: 
// Module Name: RAM_tb
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


module RAM_tb;
    reg clk, we;                  // Use reg for clock and write enable
    reg [2:0] addr;               // Address is a reg because it holds values
    reg [7:0] data_in;            // Data input is also a reg
    wire [7:0] data_out;          // Data output is a wire, as it is driven by the RAM module

    // Instantiate the RAM module
    RAM ram_inst (
        .clk(clk), 
        .we(we), 
        .addr(addr), 
        .data_in(data_in), 
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Testbench stimulus
    initial begin
        $display("Starting RAM Testbench");
        
        // Write to address 0
        we = 1;
        addr = 3'b000;
        data_in = 8'hA5; // Write 0xA5 to address 0
        #10; 
        we = 0;
        addr = 3'b000;
        #10; // Read from address 0
        $display("Data at addr %0d: %h", addr, data_out);

        // Write to address 1
        addr = 3'b001;
        data_in = 8'h3C; // Write 0x3C to address 1
        we = 1;
        #10;
        we = 0;
        addr = 3'b001;
        #10; // Read from address 1
        $display("Data at addr %0d: %h", addr, data_out);

        // End the test
        $stop;
    end
endmodule

