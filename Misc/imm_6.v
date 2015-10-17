module imm_6(in, out);
	
	input [5:0] in;
	output [15:0] out;
	assign out = {{10{1'b0}},in};

endmodule