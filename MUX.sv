module MUX
#(parameter w=4)
( input [w-1:0] Ai, Bi, Ci, Di,
  input [1:0] sel,
output reg [w-1:0] mo);

always @ * begin
	case (sel) 
		
		0: mo <= Di;
		1: mo <= Ci;
		2: mo <= Ai;
		3: mo <= Bi;
	
	endcase	
end

endmodule 