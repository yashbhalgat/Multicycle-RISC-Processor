module RISC15_test();
	
	reg clk;
	wire [2:0] StateID;
	
	RISC15 processor(clk, StateID);
	
	initial
		begin
			#5
			RISC15_test.processor.__datapath.T1out <= 16'd0;
			RISC15_test.processor.__datapath.Mux8_memwrite_out <= 1'b0;
			RISC15_test.processor.__datapath.Mux9_memDataIn_out <= 16'b0000001011110000;
		end
		
	always #5 clk = ~clk;
	
endmodule