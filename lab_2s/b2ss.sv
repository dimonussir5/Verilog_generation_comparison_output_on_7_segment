module b2ss (
input [3:0] mo,
output reg [6:0] ssi);

reg [6:0] seg_arr[15:0];

initial begin
seg_arr[0] <=  7'b0111111; //0
seg_arr[1] <=  7'b0000110; //1
seg_arr[2] <=  7'b1011011; //2
seg_arr[3] <=  7'b1001111; //3
seg_arr[4] <=  7'b1100110; //4
seg_arr[5] <=  7'b1101101; //5
seg_arr[6] <=  7'b1111101; //6
seg_arr[7] <=  7'b0000111; //7
seg_arr[8] <=  7'b1111111; //8
seg_arr[9] <=  7'b1101111; //9
seg_arr[10] <= 7'b1110111; //A
seg_arr[11] <= 7'b1111100; //B
seg_arr[12] <= 7'b0111001; //C
seg_arr[13] <= 7'b1011110; //D
seg_arr[14] <= 7'b1111001; //E
seg_arr[15] <= 7'b1110001; //F 
end

always @*
	ssi = seg_arr[mo];
endmodule 