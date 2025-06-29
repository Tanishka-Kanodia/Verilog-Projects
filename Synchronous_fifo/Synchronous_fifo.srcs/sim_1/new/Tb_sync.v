`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 17:22:16
// Design Name: 
// Module Name: Tb_sync
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


module Tb_sync();

reg clk, rst_n;
reg wr_en_i, rd_en_i;
reg [7:0] data_i;
integer i;

wire [7:0] data_o;
wire full_o, empty_o;

Sync uut(
.clk(clk),
.rst_n(rst_n),

.wr_en_i(wr_en_i),
.rd_en_i(rd_en_i),
.data_i(data_i),
.data_o(data_o),
.full_o(full_o),
.empty_o(empty_o)
);

initial
clk = 0;
always #5 clk=~clk;

initial begin
rst_n = 1'b1;

wr_en_i = 1'b0;
rd_en_i = 1'b0;

data_i = 8'b0;

#10;
rst_n = 1'b0; //Reset

#10;
rst_n = 1'b1; //Finish Reset

//Write data
wr_en_i = 1'b1;
rd_en_i = 1'b0;

for (i = 0; i < 8; i = i + 1) begin
data_i = i;
#10;
end

//Read data
wr_en_i = 1'b0;
rd_en_i = 1'b1;

for (i = 0; i < 8; i = i + 1) begin
#10;
end

//Write data
wr_en_i = 1'b1;
rd_en_i = 1'b0;

for (i = 0; i < 8; i = i + 1) begin
data_i = 1;
#10;
end

#30;
$stop;

end
endmodule
