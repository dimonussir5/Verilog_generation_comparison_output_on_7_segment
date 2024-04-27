module impl_CR_1 (
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "23"  *) 
		input bit CLK, 
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "24" *) 
		input bit RST_in,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "25" *) 	
		 input bit ENgen,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "46" *) 	 
		 input bit ENraf,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "84, 76, 85, 77, 86, 133, 87" *)	  
		 output bit [6:0] ss,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "73, 80, 74, 83" *)
		 output bit [4:1] dig,
	(* altera_attribute = "-name IO_STANDARD \"2.5-V\"", chip_pin = "69, 70, 71, 72" *)
		 output bit [3:0] usedw
);
	
bit ENwrk, RST;

cnt_div #(25'd40000000) cnt_div_inst
( 	.clk(CLK),
	.srst('1),
	.cout(ENwrk)
);

rst_reg RST_snh
(
	.clk(CLK), 
	.rst_n(RST_in),
	.rst_n_i(RST)
);

CR_1 CR_1_inst (.*);

endmodule