module CR_1(
	input bit CLK, RST, ENgen, ENraf, ENwrk, 
	output bit [6:0] ss,
	output bit [4:1] dig,
	output bit [3:0] usedw
);

bit full, rdreq, wrreq, empty;
bit [8:1] data, q, bc; 


GEN GEN_inst(.*);

FIFO FIFO_inst(
	.clock(CLK),
	.data(data),
	.rdreq(rdreq),
	.wrreq(wrreq),
	.empty(empty),
	.full(full),
	.q(q),
	.usedw(usedw)
);

RaF RaF_inst(.*); 

lab_3s lab_3s_inst(
	.clk(CLK),
	.bc(bc),
	.ss(ss),
	.dig(dig)
);


endmodule 