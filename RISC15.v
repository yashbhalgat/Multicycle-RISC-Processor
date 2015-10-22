module RISC15(clk);
	
	input wire  clk;
	wire [15:0] IR;
	wire [1:0]  Mux1_alu_B;
	wire [2:0]  Mux2_alu_A;
	wire [1:0]  Mux3_RF_wen;
	wire [2:0]  Mux4_RF_wadd;
	wire [1:0]  Mux5_RF_read2;
	wire 		Mux6_RF_dataIn;
	wire [1:0]  Mux8_memwrite;
	wire 		Mux9_memDataIn;
	wire        ALU_op,CZ_en;
	wire        memread,wIR,wAtmp, resetT1; 
	wire [2:0]  counter;
	wire 		compare;

	controller   __controller(clk, compare, IR, Mux1_alu_B, Mux2_alu_A, Mux3_RF_wen, Mux4_RF_wadd, Mux5_RF_read2,
							  Mux6_RF_dataIn, counter, Mux8_memwrite, Mux9_memDataIn, CZ_en, ALU_op, memread, wIR, wAtmp, 
				              resetT1);
	datapath 	 __datapath(clk, Mux1_alu_B, Mux2_alu_A, Mux3_RF_wen, Mux4_RF_wadd, Mux5_RF_read2,
				            Mux6_RF_dataIn, Mux8_memwrite, Mux9_memDataIn, CZ_en, ALU_op, wIR, wAtmp, 
				            resetT1, counter, compare, T1out, Mux9_memDataIn_out, memDataOut, Mux8_memwrite_out);
	memory 		 __mem(T1out, Mux9_memDataIn_out, memDataOut, Mux8_memwrite_out, memread, clk);

endmodule

module RISC15_test();

	reg [5:0]  T1out;
	reg        clk;
	reg [15:0] memIn;
	initial 
		begin
			clk <= 1'b1;
			T1out <= 6'd0;
			Mux4_RF_wadd <= 3'b000;
			IR <= 16'b0000001010100000;
			Mux3_RF_wen <= 2'b00;
		end

	always #5 clk = ~clk;

endmodule