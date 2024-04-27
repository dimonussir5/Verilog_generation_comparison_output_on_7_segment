module b2bd_LOG (
	input [7:0] bc,
	input clk,
	output reg[11:0] bdc
);
	wire [3:0] temp_a, temp_b, temp_c, temp_dh, temp_dl, temp_eh, temp_el;
	reg [7:0] bc_rg;
	
	b2bd tmpa( {1'b0, bc_rg[7:5]							  }, temp_a);
	b2bd tmpb( {temp_a[2:0]					  , bc_rg[4]  }, temp_b);	
	b2bd tmpc( {temp_b[2:0] 				  , bc_rg[3]  }, temp_c);	
	b2bd tmpdh({1'b0, temp_a[3], temp_b[3], temp_c[3] }, temp_dh);	
	b2bd tmpdl({temp_c[2:0] 				  , bc_rg[2]  }, temp_dl);	
	b2bd tmpeh({temp_dh[2:0] 				  , temp_dl[3]}, temp_eh);	
	b2bd tmpel({temp_dl[2:0] 				  , bc_rg[1]  }, temp_el);
	
	
	initial begin
	bc_rg = 0;
	bdc = 0;	
	end
	
	always @(posedge clk)begin
		bc_rg <= bc;
		bdc <= {temp_dh[3], temp_eh, temp_el, bc_rg[0]};
	end	
	
endmodule 