module d_rg 
(input clk, rst_ni,
 input [3:0] A, B, C, D,
 output reg [3:0] Ai, Bi, Ci, Di);

initial begin
	Ai = 4'hf;
	Bi = 4'h7;
	Ci = 4'h3;
	Di = 4'h0;
end

always @(posedge clk )
if (!rst_ni) begin 
		Ai = 4'hf;
		Bi = 4'h7;
		Ci = 4'h3;
		Di = 4'h0;
	end
else begin 
		Ai <= A; 
		Bi <= B;
		Ci <= C;
		Di <= D;
	end
				
endmodule 