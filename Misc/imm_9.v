module imm_9(in, out);
	
	input [8:0] in;
	output [15:0] out;
	assign out = {{7{in[8]}},in};

endmodule