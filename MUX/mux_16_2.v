module mux_16_2(inp0, inp1, sel, out);

	output reg [15:0] out;
	input  [15:0] inp0, inp1;
	input  sel;
	
	always@(inp0 or inp1 or sel) begin
		case(sel)
			0: out = inp0;
			1: out = inp1;
		endcase
	end
	
endmodule