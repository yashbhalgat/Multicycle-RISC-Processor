module mux_3_4(inp0, inp1, inp2, inp3, sel, out);

	output reg [2:0] out;
	input  [2:0] inp0, inp1, inp2, inp3;
	input  [1:0] sel;
	
	always@(inp0 or inp1 or inp2 or inp3 or sel) begin
		case(sel)
			0: out = inp0;
			1: out = inp1;
			2: out = inp2;
			3: out = inp3;
		endcase
	end
	
endmodule