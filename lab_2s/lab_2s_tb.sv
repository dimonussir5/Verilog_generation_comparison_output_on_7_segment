`timescale 1 ns/1 ns
module lab_2s_tb();
localparam CLKPERIOD = 60;
integer i;

//inputs
reg clk, rst_n;

//outputs
wire [3:0] dig; 
wire [6:0] ss; 

lab_2s DUT(clk, rst_n, ss, dig);

initial begin :clk_generation
clk = 1'b0; forever #(CLKPERIOD/2) clk = ~clk;
end

initial begin :load_data
rst_n = 1;
#(CLKPERIOD * 13)
rst_n = 0;
#(CLKPERIOD * 4)
rst_n = 1;
end

initial begin

for (i=0; i<65; i++) begin
@(posedge clk); #0.1
	
	if (dig == 8)
	begin
	#(CLKPERIOD * 10);
	$display("TEST COMPLITED");
	$stop;
	end
	
    end     
#(CLKPERIOD);
$display("TEST COMPLITED");
$stop;	
end

endmodule
