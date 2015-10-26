module setPositionZero(imm8, position, start, out );
	
	input  [7:0] imm8;
	input 	     start;
	input  [2:0] position;
	output reg [7:0] out;

	always@*
		begin
			if(start == 0)
				begin
					out <= imm8;
				end
			else 
				begin
					case(position)
						0:begin
							out <= imm8 & 8'b11111110;		
						end
						1:begin
							out <= imm8 & 8'b11111100;		
						end
						2:begin
							out <= imm8 & 8'b11111000;		
						end
						3:begin
							out <= imm8 & 8'b11110000;		
						end
						4:begin
							out <= imm8 & 8'b11100000;		
						end
						5:begin
							out <= imm8 & 8'b11000000;		
						end
						6:begin
							out <= imm8 & 8'b10000000;		
						end
						7:begin
							out <= imm8 & 8'd0;		
						end
						default:begin
							out <= imm8;
						end																				
					endcase
				end
		end

endmodule 