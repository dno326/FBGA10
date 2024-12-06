`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 12:55:41 PM
// Design Name: 
// Module Name: RegisterFile_tb
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


module RegisterFile_tb;
    reg clk, we;                   // Use reg for clk and we
    reg [2:0] read_addr1, read_addr2, write_addr; // Use reg for address inputs
    reg [7:0] write_data;          // Use reg for write data
    wire [7:0] read_data1, read_data2; // Use wire for read data outputs

    // Instantiate the RegisterFile module
    RegisterFile rf_inst (
        .clk(clk), 
        .we(we), 
        .read_addr1(read_addr1), 
        .read_addr2(read_addr2), 
        .write_addr(write_addr), 
        .write_data(write_data), 
        .read_data1(read_data1), 
        .read_data2(read_data2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Testbench stimulus
    initial begin
        $display("Starting Register File Testbench");

        // Write to register 0
        we = 1;
        write_addr = 3'b000;
        write_data = 8'h55;   // Write 0x55 to address 0
        #10;

        // Read from register 0
        we = 0;
        read_addr1 = 3'b000;
        read_addr2 = 3'b000;
        #10;
        $display("Read Data1: %h, Read Data2: %h", read_data1, read_data2);

        // Write to register 1
        write_addr = 3'b001;
        write_data = 8'hAA;   // Write 0xAA to address 1
        we = 1;
        #10;
        we = 0;

        // Read from register 1
        read_addr1 = 3'b001;
        #10;
        $display("Read Data1: %h", read_data1);

        // End the test
        $stop;
    end
endmodule
