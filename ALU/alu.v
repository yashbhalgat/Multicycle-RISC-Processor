/*
* Module for Arithmetic Logic Unit (ALU) 
* Contains the Following Instruction :
* Instructions : ADD, ADC, ADZ, ADI, NDU, NDC, NDZ 
*/

module alu(in1, in2, ALU_op, compare, carry, out, zero); 
	
	input  [15:0] in1, in2;
	input  ALU_op;
		
	output [15:0] out;
	output compare;
	output carry, zero;
	wire [15:0] outADD, outNAND;

	assign zero = ~(out[0] | out[1] | out[2] | out[3] | out[4] | out[5] | out[6] | out[7] | out[8] | out[9] | out[10] | out[11] | out[12] | out[13] | out[14] | out[15]);
	carry_generate __carry_gen(in1,in2,carry,ALU_op);
	assign out = ALU_op ? outNAND : outADD;
	assign compare = in1 == in2 ? 1'b1 : 1'b0;

	add16 __add(in1, in2, outADD);
	nand16 __nand(in1, in2, outNAND);

endmodule
