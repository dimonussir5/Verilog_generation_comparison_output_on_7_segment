module lab_1s (
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "23" *)
	input clk,	
	(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "64" *)
	input rst_n,
	(* altera_attribute = "-name IO_STANDARD \"2.5-V\"", chip_pin = "65, 66, 67, 68, 69, 70, 71, 72" *)		
	output reg [7:0]dout);
	
wire [7:0] dint;

wire rst_n_i, ena;

rst_reg reset_rg(clk, rst_n, rst_n_i);

cnt_div #(.cm()) //12500000
  counter_div(clk, rst_n_i, ena);

led_drv led_driver(clk, rst_n_i, ena, dint);

led_rg out_reg (clk, rst_n_i, dint, dout);

endmodule 