module datapath()

	wire [15:0] ALU_in1, ALU_in2, ALU_out;


	alu __alu(ALU_in1, ALU_in2, ALU_op, compare, carry, ALU_out, zero, pos, neg)

endmodule