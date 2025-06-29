`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 16:28:00
// Design Name: 
// Module Name: Sync
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


module Sync(

input clk,
input rst_n,

//read side
input wr_en_i,
input [7:0] data_i,
output full_o,

//write side
input rd_en_i,
output reg [7:0] data_o,
output empty_o
    );

parameter DEPTH = 8; //number of bits that can be stored
reg [7:0] mem [0: DEPTH-1];
reg [2:0] wr_ptr; //3bits
reg [2:0] rd_ptr; //3bits
reg [3:0] count; // when fifo is full, its value is 8, thus it ranges from 0000 to 1000

assign full_o = (count==DEPTH)? 1 : 0;
assign empty_o = (count==0)? 1 : 0;

// WRITE PROCESS
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
    wr_ptr <=0;
    end else begin
        if (wr_en_i == 1) begin
        mem[wr_ptr] <= data_i;
        wr_ptr <= wr_ptr + 1;
        end
    end
end

// READ PROCESS
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
    rd_ptr <=0;
    end else begin
        if (rd_en_i == 1) begin
        data_o = mem[rd_ptr];
        rd_ptr <= rd_ptr + 1;
        end
    end
end

// Count Handling
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count <= 4'd0;
        end else begin
         if (wr_en_i == 1) begin
            count <= count + 1;
        end
        if (rd_en_i == 1) begin
            count <= count - 1;
        end
    end
end
endmodule

