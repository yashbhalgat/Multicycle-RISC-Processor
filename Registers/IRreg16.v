/*
* Active Low write register
*/

module IRreg16(clk, out, in, write, reset);  

	output reg [15:0] out;
	input      [15:0] in;
	input      clk, write, reset;
	
	always@(negedge clk) begin
		if(reset==0) begin
			out = 16'b0;
		end
		else if(write == 1'b0) begin
			out = in;
		end
	end
	
endmodule