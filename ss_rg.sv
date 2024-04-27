module ss_rg 
(input clk, rst_ni,
 input [6:0] ssi,
 output reg [6:0] ss);

initial ss = 0;

always @(posedge clk )
if (!rst_ni) 
	ss <= 0;
else 
	ss <= ssi;

			
endmodule 