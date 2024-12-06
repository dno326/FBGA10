`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 12:47:05 PM
// Design Name: 
// Module Name: RAM
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


module RAM(i_clk, i_rst,  i_addr, i_write_data,i_write_en, o_read_data);

 

parameter DATA_W = 8;

parameter SIZE = 8;

parameter ADDR_W = 3;

 

input i_clk, i_rst, i_write_en;

input [ADDR_W-1:0] i_addr;

input [DATA_W-1:0] i_write_data;

output reg [DATA_W-1:0] o_read_data;

 

reg [DATA_W-1:0] mem[0:SIZE-1];// 8 words, each has 4 bits

 

integer i;

 

always @(posedge i_clk) begin

              if(i_rst) begin

                             for (i=0; i<SIZE;i=i+1) begin

                                           mem[i] <= 0;

                             end

              end

             

              else begin

              if(i_write_en)

                mem[i_addr] <= i_write_data;

                else

                o_read_data<=mem[i_addr];

                             end

              end

endmodule      


//module RAM (
//    input clk,                  // Clock input
//    input we,                   // Write enable
//    input [2:0] addr,           // 3-bit address for 8 locations
//    input [7:0] data_in,        // 8-bit input data
//    output reg [7:0] data_out   // 8-bit output data, reg because it holds a value
//);
//    reg [7:0] memory [7:0];     // 8x8 RAM, reg for memory

//    always @(posedge clk) begin
//        if (we)
//            memory[addr] <= data_in; // Write data
//        else
//            data_out <= memory[addr]; // Read data
//    end
//endmodule

