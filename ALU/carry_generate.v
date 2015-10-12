module carry_generate(in1,in2,carry,op_code);

input  [15:0] in1, in2;
input  op_code;
inout wire carry;
reg tmp_carry;
reg [15:0] tmp_add;

always @*
	begin

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

assign carry = tmp_carry;

endmodule