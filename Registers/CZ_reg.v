module CZ_reg(IR_CZ,inC,inZ,en,out);

	input       inC, inZ, en;
	input [1:0] IR_CZ;
	output      out;
	reg C,Z;

	assign out = ~((~IR_CZ[1]&~IR_CZ[0]) | (IR_CZ[0]&~IR_CZ[1]&Z) | (~IR_CZ[0]&IR_CZ[1]&C));

	always @*
		begin
			if(en == 0)
				begin
					Z <= inZ;
					C <= inC;				
				end
		end

endmodule