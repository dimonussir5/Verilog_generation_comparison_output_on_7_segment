module led_rg 
(input clk, rst_n_i,
 input [7:0] dint,
 output reg [7:0] dout);

initial dout = 0;

always @(posedge clk )
if (!rst_n_i) 
	dout <= 0;
else 
	dout <= dint;

			
endmodule 