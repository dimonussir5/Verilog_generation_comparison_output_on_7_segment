`timescale 1ns/1ns
module tb_RaF();
	bit 		 CLK, RST, ENraf, ENwrk, empty,rdreq;
	bit [8:1] q;
	bit [8:1] bc;

RaF RaF_inst (.*);

always #10 CLK = ~ CLK;

initial 
begin 
	RST = '1;
	#15;
	RST  = '0;
	
	ENraf = '1;
	ENwrk = '1;
	empty  = '1;
	
	#15;
	empty  = '0;
	
	#5
	q = 3;
	#20
	q = 8;
	#20
	q = 1;
	#20
	q = 30;
	#20
	q = 126;
	#20
	q = 18;
	
	#100;
	$stop;
end
endmodule 