module shift_7(input, output)
	
	input [8:0] input;
	output [15:0] output;
	assign ouput = input << 7;

endmodule