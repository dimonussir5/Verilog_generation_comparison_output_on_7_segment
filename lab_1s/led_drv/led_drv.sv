module led_drv (
 input clk, rst_n_i, ena,
 output reg [7:0] dint 
 );

reg [7:0] mem [31:0];
reg [4:0] i;

initial begin
	$readmemb("ROM.txt", mem);
	i = 32;
	end
 
always @(posedge clk )
if (ena) begin
	if (!rst_n_i) 
		i = 0;
	else
		i++;	
	
end

assign dint = mem[i];
			
endmodule 