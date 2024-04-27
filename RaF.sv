module RaF(
	input bit CLK, RST, ENraf, ENwrk, empty,
	input bit [7:0] q, 
	output bit [7:0] bc,
	output bit rdreq
);
assign ENA = (ENraf && ENwrk && ~empty);

always_ff @(posedge CLK)
if (RST)		bc <= '0;
else if (ENA) 
			if (q > bc) 
				bc <= q;
				
assign rdreq = ENA;
endmodule 