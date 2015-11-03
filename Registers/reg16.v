/*
* Active Low write register
*/

module reg16(clk, out, in, write, reset, proc_rst);  

	output reg [15:0] out;
	input      [15:0] in;
	input      proc_rst, clk, write, reset;
	
	always@(negedge clk) begin
		if(proc_rst==0)
			begin
				out = 16'd0;
			end
		if(reset==0) begin
			out = 16'b0;
		end
		else if(write == 1'b0) begin
			out = in;
		end
	end
	
endmodule