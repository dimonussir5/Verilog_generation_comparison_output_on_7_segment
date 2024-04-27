`timescale 1 ns/1 ns
module FSM_tb();
localparam CLKPERIOD = 60;
integer i;

//inputs
reg	   clk , rst_ni, ENA;

reg  [5:0] expected_mem [0:9];
reg  [5:0] expected;
//outputs
wire [1:0] sel;
wire [3:0] digi; 

FSM DUT(clk, rst_ni, ENA, sel, digi);

initial begin :clk_generation
clk = 1'b0; forever #(CLKPERIOD/2) clk = ~clk;
end

initial begin :load_data
$readmemb("exp_data.txt", expected_mem);
rst_ni = 1;
ENA = 1;
#(CLKPERIOD * 5) ENA = 0;
#(CLKPERIOD * 2 + 20) rst_ni = 0;
#(20) rst_ni = 1;
#(20) ENA = 1;
end

initial begin

for (i=0; i<10; i++) begin
@(posedge clk); #0.1
	expected = expected_mem[i];
	if (expected == 63)
	begin
	$display("TEST COMPLITED");
	$display("expected_file end at length - %0d", i);
	$stop;
	end
	    
	if (expected !== {sel, digi})
	begin
		$display("%d : Calculated: sel = %2b, digi = %4b\n\t\t\t Expected: exp_sel = %2b, exp_digi = %4b/n ",
		$time, sel, digi, expected[5:4], expected[3:0]);
		$stop; 
	end
    end     
#(CLKPERIOD*3);
$display("TEST COMPLITED");
$stop;	
end

endmodule

