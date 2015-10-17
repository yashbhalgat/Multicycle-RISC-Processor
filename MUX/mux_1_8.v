module mux_1_8(inp0, inp1, inp2, inp3, inp4, inp5, inp6, inp7, sel, out);

	output reg out;
	input  inp0, inp1, inp2, inp3, inp4, inp5, inp6, inp7;
	input  [2:0] sel;
	
	always@(inp0 or inp1 or inp2 or inp3 or inp4 or inp5 or inp6 or inp7 or sel) begin
		case(sel)
			0: out = inp0;
			1: out = inp1;
			2: out = inp2;
			3: out = inp3;
			4: out = inp4;
			5: out = inp5;
			6: out = inp6;
			7: out = inp7;
		endcase
	end
	
endmodule