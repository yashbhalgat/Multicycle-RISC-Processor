module imm_6(input, output)
	
	input [5:0] input;
	output [15:0] output;
	assign ouput = {10{0},input};

endmodule