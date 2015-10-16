module imm_9(input, output)
	
	input [8:0] input;
	output [15:0] output;
	assign ouput = {7{0},input};

endmodule