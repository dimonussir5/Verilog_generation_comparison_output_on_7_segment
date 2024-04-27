module rst_reg 
(input clk, rst_n,
 output reg rst_n_i);

reg rst;

initial begin
rst = 1;
rst_n_i = 1;
end

always @(posedge clk ) begin
	rst <= rst_n;
	rst_n_i <= rst;
end
			
endmodule 