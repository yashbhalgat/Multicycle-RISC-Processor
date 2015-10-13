/*
* Module for Arithmetic Logic Unit (ALU) 
* Contains the Following Instruction :
* Instructions : ADD, ADC, ADZ, ADI, NDU, NDC, NDZ 
*/

module alu(in1, in2, op_code, condition, carry, out, zero, pos, neg); 
	
	output [15:0] out;
	input  [15:0] in1, in2;
	input  op_code;
	input  [1:0] condition;
	output pos, neg;
	inout wire carry, zero;

	nor n1(zero,out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7],out[8],out[9],out[10],out[11],out[12],out[13],out[14],out[15]);
	assign pos = ~out[15];
	assign neg = out[15];
	wire [15:0] outADD, outNAND, inpBuffer;

	assign inpBuffer = op_code ? outNAND : outADD;
	assign enable_buf = (~condition[1]&~condition[0]) | (~condition[0]&condition[1]&zero) | (condition[0]&~condition[1]&carry); 
	buffer outBuffer(out,inpBuffer,enable_buf);

	add16 __add(in1, in2, outADD);
	nand16 __nand(in1, in2, outNAND);

	carry_generate carry_gen(in1,in2,carry,op_code);
	
endmodule
