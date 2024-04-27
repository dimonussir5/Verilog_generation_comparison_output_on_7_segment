`timescale 1 ns/1 ns
module cnt_drv_tb();
localparam CLKPERIOD = 60;
//inputs
reg  clk, rst;

//outputs
wire cout; 

cnt_div #(.cm(4)) 
   DUT(clk, rst, cout);

initial begin :clk_generation
clk = 1'b0; forever #(CLKPERIOD/2) clk = ~clk;
end

initial begin :rst_init 
rst = 1;
#(14 *CLKPERIOD) 
rst = 0;
#(CLKPERIOD)
rst = 1;
#(3 * CLKPERIOD)
$display("TEST COMPLITED");
$stop;
end
endmodule
