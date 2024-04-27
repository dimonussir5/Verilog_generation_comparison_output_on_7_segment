`timescale 1ns/1ns
module tb_CR_1();
	bit CLK, RST, ENgen, ENraf, ENwrk; 
	bit [6:0] ss;
	bit [4:1] dig;
	bit [3:0] usedw;

CR_1 CR_1_inst (.*);

always #10 CLK = ~ CLK;

initial 
begin
	RST = '1;
	#15;
	
	RST  = '0;	
	ENraf = '0;
	ENgen = '1;
	ENwrk = '1;	
	
	repeat (20) @(negedge CLK);
	ENraf = '1;
	ENgen = '0;
	
	repeat (200) @(negedge CLK);
	ENgen = '1;
	
	repeat (85) @(negedge CLK);
	ENwrk = '0;	
	
	repeat (3) @(negedge CLK);
	RST  = '1;	
	
	repeat (3) @(negedge CLK);
	#100;
	$stop;
end
endmodule 