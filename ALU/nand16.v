/*
* Module nand16  
* Instruction Desc : nand 2 numbers
*/

module nand16(in1, in2, out);
	
	input  [15:0] in1, in2;
	output [15:0] out;

	assign out = ~(in1 & in2);
	
endmodule
