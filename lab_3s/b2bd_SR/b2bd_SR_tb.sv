`timescale 1 ns/1 ns
module b2bd_SR_tb();
localparam CLKPERIOD = 60;
integer i;

//inputs
reg  [7:0] bc;
reg  clk;


reg  [11:0] expected_mem [0:255];
reg  [11:0] exp;
reg  [1:0] hdr;
reg  [3:0] dec;
reg  [3:0] unit;
reg  [8:0] adr;
//outputs
wire [11:0] bdc;

b2bd_SR DUT1(bc, clk, bdc);

initial begin: clk_generator
clk = 1'b0;
forever #(CLKPERIOD/2) clk <= ~clk;
end

initial begin :load_mem
for (hdr = 2'd0; hdr <= 2'd2; hdr++)
	for (dec = 4'd0; dec <= 4'd9; dec++)
		for (unit = 4'd0; unit <= 4'd9; unit++)
			if (adr < 9'd256) begin
				expected_mem [adr[7:0]] = {2'b0, hdr, dec, unit};
				adr++;		
			end

end

initial begin
for(adr = 9'd0; adr < 9'd256; adr++)begin
	bc = adr;
	#(11*CLKPERIOD)
	exp = expected_mem[adr[7:0]];
	if(bdc != exp)begin
		$display("TEST FAILD");
		$display("Calculated bdc: %0d%0d%0d,\n Expected bdc: %0d%0d%0d", bdc[11:8], bdc[7:4], bdc[3:0],  exp[11:8], exp[7:4], exp[3:0]);
		$stop;
	end

end
$display("TEST COMPLITED");
$stop;

end

endmodule

