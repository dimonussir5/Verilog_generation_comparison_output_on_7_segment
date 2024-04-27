 module FSM( 
	input clk, rst_ni, ENA,
  output reg [1:0] sel,
  output reg [3:0] digi);
 
 //declare state reg
 reg [1:0] state;
 
 //states
 parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;
 initial begin
 state = s0;
 end
 
 //next state logic
 always @(posedge clk or negedge rst_ni) begin
	if (!rst_ni)
		state = s0;
	else
		if(ENA)
			case (state)
				s0: state <= s1;
				
				s1: state <= s2;
			
				s2: state <= s3;
			
				s3: state <= s0;
			
			endcase
		
		
 end
 
 //output
 always @(state) begin
   	case (state)
			s0: begin
				 sel  <= 2'b00;
				 digi <= 4'b0001;
				 end 
				 
			s1: begin
				 sel  <= 2'b01;
				 digi <= 4'b0010;
				 end
			s2: begin
				 sel  <= 2'b11;
				 digi <= 4'b0100;
				 end 
				 
			s3: begin
				 sel  <= 2'b10;
				 digi <= 4'b1000;
				 end
		endcase
 end
 
endmodule 