module GEN(
	input bit CLK, ENgen, ENwrk, full,
	output bit [8:1] data,
	output bit wrreq
);
assign ENA = (ENgen && ENwrk && ~full);

always_ff @(posedge CLK)
if (ENA) 
			if (data == '0) 
				data <= 8'd1;
			else
				data <= {data[7:1], data[8]~^data[5]~^data[3]~^data[2]};

assign wrreq = ENA;
endmodule 