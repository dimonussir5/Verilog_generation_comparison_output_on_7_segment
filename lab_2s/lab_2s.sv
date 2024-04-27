module lab_2s(
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "23" *)
	input clk,	
	(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "64" *)
	input rst_n,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "84, 76, 85, 77, 86, 133, 87" *)		
	output reg [6:0] ss,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "73, 80, 74, 83" *)	
	output reg [3:0] dig);

	
ss_cntr #(.cm(500000))  //12500000 
	ss_cntr(.clk(clk), .rst_n(rst_n), .A(4'hf), .B(4'h7), .C(4'h3), .D(4'h0), .ss(ss), .dig(dig));
	

			
endmodule 