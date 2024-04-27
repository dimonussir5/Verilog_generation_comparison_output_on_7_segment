module b2bd_SR(
	input [7:0] bc,
	input clk,
	output [11:0] bdc
);
	reg load, ENA;
	
	reg [3:0] cnt_t, rg_unit, rg_dec, rg_hdr, F_unit, F_dec;
	
	reg [7:0] bc_old_rg, bc_new_rg, shrg_bc;
	
	
	initial begin
	
	load      = 0;
	ENA       = 0;
	
	cnt_t     = 7;
	
	bc_old_rg = 0;
	bc_new_rg = 0;
	
	shrg_bc   = 0;
	
	rg_unit   = 0;
	rg_dec    = 0;
	rg_hdr    = 0;
	
	F_unit    = 0;
	F_dec     = 0;
	
	end
	
	
	//Set_load
	always @(posedge clk) begin
		bc_old_rg <= bc;
		bc_new_rg <= bc_old_rg;
		
		load <= (bc_new_rg != bc_old_rg);		
	end
	
	//Cnt_t
	always @(posedge clk) begin
		if(load) begin
				cnt_t <= 4'd0;
				ENA <= 1;
			end
		else 
			if(cnt_t < 4'd7) begin
					cnt_t <= cnt_t + 4'd1;					
				end
			else
				ENA <= 0;
				
	end
	
	//Shrg_bc
	always @(posedge clk) begin
		if(load) 
			shrg_bc <= bc_new_rg;
		else 
			if(ENA) 
				shrg_bc <= shrg_bc << 1;					
				
	end
	
	
	//registers unit, deg, hdr
	always @(posedge clk) begin
		if(load) begin
				rg_unit <= 0;
				rg_dec  <= 0;
				rg_hdr  <= 0;
			end
		else 
			if(ENA) 
				{rg_hdr, rg_dec, rg_unit} <= {rg_hdr[2:0], F_dec, F_unit, shrg_bc[7]};			
				
	end
	
	//Func unit, deg
	always @* begin
		F_unit = (rg_unit < 4'b0101) ? rg_unit : (rg_unit + 4'b0011);
		F_dec  = (rg_dec < 4'b0101) ? rg_dec : (rg_dec + 4'b0011);	
	end
	
	assign
	bdc = {rg_hdr, rg_dec, rg_unit};
	
endmodule 