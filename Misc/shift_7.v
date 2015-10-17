module shift_7(in, out);
	
	input [8:0] in;
	output [15:0] out;
	assign out = in << 7;

endmodule