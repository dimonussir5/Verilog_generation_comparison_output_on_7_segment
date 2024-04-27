module b2bd(
		input [3:0] bc,
		output [3:0] bd
	);
	assign
	bd = (bc < 4'b0101) ? bc : bc + 4'b0011;
endmodule 