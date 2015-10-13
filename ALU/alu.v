/*
* Module for Arithmetic Logic Unit (ALU) 
* Contains the Following Instruction :
* Instructions : ADD, ADC, ADZ, ADI, NDU, NDC, NDZ 
*/

module alu(in1, in2, op_code, condition, carry, out, zero, pos, neg, write); 
	
	output [15:0] out;
	input  [15:0] in1, in2;
	input  op_code;
	input  [1:0] condition;
	output pos, neg, write;
	output reg write;
	inout wire carry, zero;
	reg tmp_carry, tmp_zero;

	always @*
		begin
			write = (~condition[1]&~condition[0]) | (~condition[0]&condition[1]&zero) | (condition[0]&~condition[1]&carry); 
			tmp_zero = ~(out[0] +out[1] +out[2] +out[3] +out[4] +out[5] +out[6] +out[7] +out[8] +out[9] +out[10] +out[11] +out[12] +out[13] +out[14] +out[15]);
			if(op_code == 0)
				begin
					if(in1[15] & in2[15])
						begin
							tmp_carry = 1;
						end
					else if(~in1[15] & ~in2[15])
						begin
							tmp_carry = 0;
						end
					else if(in1[15] ^ in2[15])
						begin
							tmp_add = {1'b0,in1[14:0]} + {1'b0,in2[14:0]};
							tmp_carry = tmp_add[15];
						end
				end
		end

	assign zero = tmp_zero;
	assign carry = tmp_carry;
	assign pos = ~out[15];
	assign neg = out[15];

	wire [15:0] outADD, outNAND;
	assign out = op_code ? outNAND : outADD;

	add16 __add(in1, in2, outADD);
	nand16 __nand(in1, in2, outNAND);

	// carry_generate carry_gen(in1,in2,carry,op_code);

endmodule
