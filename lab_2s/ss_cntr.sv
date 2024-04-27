module ss_cntr 
# (parameter cm = 5)
	(input clk, rst_n,
	input [3:0] A, B, C, D,
	output reg [6:0] ss,
	output reg [3:0] dig);
	

wire [3:0] Ai, Bi, Ci, Di, digi, mo;
wire [1:0] sel;
wire [6:0] ssi;
wire rst_ni, ENA;

//input reg
	rst_reg reset_rg(clk, rst_n, rst_ni);

	cnt_div #(.cm(cm)) 
		counter_div(clk, rst_ni, ENA);
  
	d_rg data_reg(clk, rst_ni, A, B, C, D, Ai, Bi, Ci, Di);

//FSM
	FSM fsm(clk, rst_ni, ENA, sel, digi);

//data -> 7seg
	MUX mux2(Ai, Bi, Ci, Di, sel, mo);

	b2ss binTo7Seg(mo, ssi);

//output reg
	ss_rg seg_reg(clk, rst_ni, ssi, ss);
	
	dig_rg dig_reg(clk, rst_ni, digi, dig);

endmodule 