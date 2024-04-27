`timescale 1ns/1ns
module db_CR_1 (
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "23" *)
	input bit CLK
);

bit RST, ENgen, ENraf, ENwrk;
bit [6:0] ss;
bit [4:1] dig;
bit [3:0] usedw;

SP_unit SP_unit_inst (
	.source ({RST, ENgen, ENraf, ENwrk}),
	.source_clk (CLK)
);

CR_1 CR_1_inst (.*);
endmodule 