`timescale 1 ns/1 ns
module b2bd_ROM_tb();
localparam CLKPERIOD = 60;
integer i;

//inputs
reg  [7:0] bc;
reg  clk;

reg [8:0] adr ;
reg  [11:0] expected_mem [0:255];
reg  [11:0] expected;
//outputs
wire [11:0] bdc_sr;
wire [11:0] bdc_log;
wire [11:0] bdc_rom;

b2bd_SR  DUT1(bc, clk, bdc_sr);
b2bd_LOG DUT2(bc, clk, bdc_log);
b2bd_ROM DUT3(bc, clk, bdc_rom);

initial begin: clk_generator
clk = 1'b0;
forever #(CLKPERIOD/2) clk <= ~clk;
end

initial begin :load_data
$readmemb("mem.txt", expected_mem);
end

initial begin : processing

for(adr = 9'd0; adr < 9'd256; adr++)begin
	bc = adr;
	expected = expected_mem[adr];
	
	#(11*CLKPERIOD)
	
	if(bdc_sr != bdc_log)
		begin
		$display("TEST FAILD");
		$display("Calculated bdc_sr: %0d%0d%0d,\nCalculated bdc_log: %0d%0d%0d", bdc_sr[11:8], bdc_sr[7:4], bdc_sr[3:0],  bdc_log[11:8], bdc_log[7:4], bdc_log[3:0]);
		$stop;
		end

	if(bdc_sr != bdc_rom)
		begin
		$display("TEST FAILD");
		$display("Calculated bdc_sr(=bdc_log): %0d%0d%0d,\nCalculated bdc_rom: %0d%0d%0d", bdc_sr[11:8], bdc_sr[7:4], bdc_sr[3:0],  bdc_rom[11:8], bdc_rom[7:4], bdc_rom[3:0]);
		$stop;
		end
	if(bdc_sr != expected)
		begin
		$display("TEST FAILD");
		$display("Calculated bdc_sr(=bdc_log): %0d%0d%0d,\nCalculated bdc_exp: %0d%0d%0d", bdc_sr[11:8], bdc_sr[7:4], bdc_sr[3:0],  expected[11:8], expected[7:4], expected[3:0]);
		$stop;
		end

end
$display("TEST COMPLITED");
$stop;

end

endmodule

