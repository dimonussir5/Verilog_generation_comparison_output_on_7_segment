`timescale 1 ns/1 ns
module MUX_tb();
localparam CLKPERIOD = 60;
integer i;

//inputs
reg  [3:0] A, B, C, D;
reg  [1:0] sel;

reg  [3:0] expected_mem [0:8];
reg  [3:0] expected;
//outputs
wire [3:0] res; 

MUX DUT(A, B, C, D, sel, res);


initial begin :load_data
$readmemh("exp_data.txt", expected_mem);
{A, B, C, D} = 16'hf00f;
#(60 * 4 )
{A, B, C, D} = 16'h0ff0;
end

initial begin
sel = 0;

for (i=0; i<9; i++) begin
#(10)
	expected = expected_mem[i];
	if (expected == 10)
	begin
	$display("TEST COMPLITED");
	$display("expected_file end at length - %0d", i);
	$stop;
	end
	    
	if (expected !== res)
	begin
		$display("%d : Calculated: res = %4b\n\t\t\t Expected: exp_res = %4b/n ",
		$time, res , expected);
		$stop; 
	end
#(50)
	sel = sel +1;
    end     
end

endmodule
