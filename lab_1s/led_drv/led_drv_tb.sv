`timescale 1 ns/1 ns
module led_drv_tb();
localparam CLKPERIOD = 60;
reg [5:0] i;
//inputs
reg   ena, clk, rst;
reg  [7:0] expect_out;
integer expect_file, char, ret;

//outputs
wire [7:0] dint; 

led_drv DUT(clk, rst, ena, dint);

initial begin :clk_generation
clk = 1'b0; forever #(CLKPERIOD/2) clk = ~clk;
end

initial begin :rst_init
expect_file = $fopen("exp.txt", "r");
rst = 1;
#(31 * CLKPERIOD) rst = 0;
#(CLKPERIOD) rst = 1;
end

initial begin :ena_init
ena = 1;
#(33 * CLKPERIOD) ena = 0;
#CLKPERIOD ena = 1;
end


`define eof 32'hffff_ffff
initial begin
expect_out = 0;
for (i=1; i<36; i++) begin
@(posedge clk); #0.1
	char = $fgetc(expect_file);
	if (char == `eof)
	begin
	$display("TEST COMPLITED");
	$display("expected_file end at length - %0d", i);
	$stop;
	end
	ret = $ungetc(char, expect_file);
	ret = $fscanf(expect_file, "%b", expect_out);
    
	if (expect_out !== dint)
	begin
		$display("%d : Calculated:/n dint = %0d/n Expected:/n exp = %0d",
		$time, dint, expect_out);
		$stop; 
	end
    end     
#(CLKPERIOD);
$display("TEST COMPLITED");
$stop;	
end

endmodule
