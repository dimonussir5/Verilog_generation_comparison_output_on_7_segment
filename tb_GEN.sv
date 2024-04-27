`timescale 1ns/1ns
module tb_GEN();
	bit 		 CLK, ENgen, ENwrk, full, wrreq;
	bit [8:1] data;
	bit [8:1] data1;
	bit [8:1] CNT_int = 8'd1;

GEN GEN_inst (.*);

always #10 CLK = ~ CLK;

initial 
begin 
	ENgen = '1;
	ENwrk = '0;
	full  = '1; 
	data1 = '1;
	#15;
	full  = '0;
	#25;
	ENwrk = '1;
	#45;
	ENgen = '0;
	#25;
	ENgen = '1;
	
	forever begin 
		@(negedge CLK);
		if (CNT_int == '0) begin
			data1 = data; //fixing the first data to check Galois 
			end
		else
			if (data1 == data) //to check Galois 
				break;
		CNT_int++;
	end 
	#100;
	$stop;
end
endmodule 