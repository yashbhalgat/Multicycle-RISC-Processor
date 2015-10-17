/*
* Module for Arithmetic Logic Unit (ALU) 
* Contains the Following Instruction :
* Instructions : ADD, ADC, ADZ, ADI, NDU, NDC, NDZ 
*/

module alu(in1, in2, ALU_op, compare, carry, out, zero, pos, neg); 
	
	output [15:0] out;
	input  [15:0] in1, in2;
	input  ALU_op;
	input  [1:0] condition;
	output compare, pos, neg;
	output reg write;
	inout wire carry, zero;
	wire [15:0] outADD, outNAND;

	// always @(ALU_op or condition or in1 or in2)
	// 	begin
	// 		write = (~condition[1]&~condition[0]) | (condition[0]&~condition[1]&zero) | (~condition[0]&condition[1]&carry); 
			// tmp_zero = ~(out[0] | out[1] | out[2] | out[3] | out[4] | out[5] | out[6] | out[7] | out[8] | out[9] | out[10] | out[11] | out[12] | out[13] | out[14] | out[15]);
	// 		if(ALU_op == 0)
	// 			begin
	// 				if(in1[15] & in2[15])
	// 					begin
	// 						tmp_carry = 1;
	// 					end
	// 				else if(~in1[15] & ~in2[15])
	// 					begin
	// 						tmp_carry = 0;
	// 					end
	// 				else if(in1[15] ^ in2[15])
	// 					begin
	// 						tmp_add = {1'b0,in1[14:0]} + {1'b0,in2[14:0]};
	// 						tmp_carry = tmp_add[15];
	// 					end
	// 			end
	// 	end

	assign zero = ~(out[0] | out[1] | out[2] | out[3] | out[4] | out[5] | out[6] | out[7] | out[8] | out[9] | out[10] | out[11] | out[12] | out[13] | out[14] | out[15]);
	carry_generate __carry_gen(in1,in2,carry,ALU_op);
	assign pos = ~out[15];
	assign neg = out[15];
	assign out = ALU_op ? outNAND : outADD;
	assign compare = in1 == in2 ? 1'b1 : 1'b0;


	add16 __add(in1, in2, outADD);
	nand16 __nand(in1, in2, outNAND);

endmodule
