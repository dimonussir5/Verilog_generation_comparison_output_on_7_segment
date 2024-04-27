module b2bd_ROM (
	input [7:0] bc,
	input clk,
	output [11:0] bdc
);
	//dop reg
	reg  [7:0] bc_rg;
	//mem
	reg  [11:0] mem [0:255];
	//loop variable
	reg  [1:0] hdr;
	reg  [3:0] dec;
	reg  [3:0] unit;
	reg  [8:0] adr;
	
initial begin
	adr = 0;
	for (hdr = 2'd0; hdr <= 2'd2; hdr++)
		for (dec = 4'd0; dec <= 4'd9; dec++)
			for (unit = 4'd0; unit <= 4'd9; unit++)
				if (adr < 9'd256) begin
					mem [adr[7:0]] = {2'b0, hdr, dec, unit};
					adr++;		
				end
end
	
always @(posedge clk) begin
	bc_rg <= bc;
	
end

assign bdc = mem[bc_rg];
endmodule 