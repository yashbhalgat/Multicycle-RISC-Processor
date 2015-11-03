module clockgen(clk,clk1);

	input clk;
	output reg clk1; 
	reg [20:0] clk_counter;

	initial
		begin
			clk1 <= 1'b1;
			clk_counter <= 21'd0;					
		end

	always@(negedge clk)
		begin
			clk_counter <= clk_counter + 1'b1;
			if(clk_counter == 21'b111111111111111111111)
				begin
					clk1 <= ~clk1;
					clk_counter <= 21'd0;
				end
		end
endmodule