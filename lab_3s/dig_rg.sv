module dig_rg 
(input clk, rst_ni,
 input [3:0] digi,
 output reg [3:0] dig);

initial dig = 0;

always @(posedge clk )
if (!rst_ni) 
	dig <= 0;
else 
	dig <= digi;

			
endmodule 