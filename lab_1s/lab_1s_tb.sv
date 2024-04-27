`timescale 1 ns/1 ns
module lab_1s_tb();
localparam CLKPERIOD = 60;
//inputs
reg  clk, rst;

//outputs
wire [7:0] dout; 

lab_1s DUT(clk, rst, dout);

initial begin :clk_generation
clk = 1'b0; forever #(CLKPERIOD/2) clk = ~clk;
end

initial begin :rst_init 
rst = 1;
#(17 *CLKPERIOD) 
rst = 0;
#(2 * CLKPERIOD)
rst = 1;
while (dout != 8'b10000000)
@(posedge clk)
$display("TEST COMPLITED");
$stop;
//#(100 * 4 * CLKPERIOD) $stop;
end

endmodule

