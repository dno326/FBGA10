`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 01:08:31 PM
// Design Name: 
// Module Name: TopModule
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


module TopModule (
    input clk, reset, 
    input [2:0] rom_addr1, rom_addr2,
    output [7:0] result
                  // Clock input                          // Start input
);
    wire [2:0] st_out; 
    wire [3:0] rom_data, A,B;                 // ROM data output, wire type
    wire [7:0] product;                 // Product of multiplication, wire type
    wire [2:0] rom_addr;       // Address signals, wire type
    reg [2:0]  ram_addr = 3'b000;
    wire w_rf,w_ram, DA,SA,SB;
    
    // Instantiating the submodules
    
 ControlUnit uut2(  clk, reset,rom_addr1, rom_addr2, w_rf, rom_addr, DA,SA,SB,st_out,w_ram);

    ROM rom_inst (
        .addr(rom_addr), 
        .data_out(rom_data)
    );

RegisterFile uut3(A, B, SA, SB, rom_data, DA, w_rf, reset, clk);

    Multiply mul_inst (
        .operand1( A), 
        .operand2(B), 
        .product(product)
    );
    
 RAM uut1(clk, rst, ram_addr, product[7:0],w_ram, result);

endmodule

/*  RegisterFile rf_inst (
        .clk(clk), 
        .we(write_ram), 
        .read_addr1(3'b000), 
        .read_addr2(3'b001),
        .write_addr(3'b010), 
        .write_data(product[7:0]),
        .read_data1(reg1_data), 
        .read_data2(reg2_data)
    );
*/

/*    RAM ram_inst (
        .clk(clk), 
        .we(write_ram), 
        .addr(ram_addr), 
        .data_in(product[7:0]), 
        .data_out(ram_data_out)
    );*/

   /* ControlUnit cu_inst (
        .clk(clk), 
        .start(start), 
        .read_rom(read_rom), 
        .write_ram(write_ram),
        .rom_addr(rom_addr), 
        .ram_addr(ram_addr)
    );*/
    
    //wire [7:0] ram_data_out, reg1_data, reg2_data; // RAM, Register data, wire type
    
      // reg read_rom, write_ram;             // Control signals, reg type since driven by always block
