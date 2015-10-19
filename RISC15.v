module RISC15(clk, StateID);
	
	input wire  clk;
	wire [15:0] memDataOut;
	wire [15:0] IRout, T1out, Mux9_memDataIn_out;
	wire [2:0]  Mux1_alu_B;
	wire [2:0]  Mux2_alu_A;
	wire [1:0]  Mux3_RF_wen;
	wire [2:0]  Mux4_RF_wadd;
	wire [1:0]  Mux5_RF_read2;
	wire 		Mux6_RF_dataIn;
	wire [1:0]  Mux8_memwrite;
	wire 		Mux9_memDataIn;
	wire        ALU_op,CZ_en;
	wire        memread,wIR,wAtmp; 
	wire [2:0]  counter;
	wire 		compare, Mux8_memwrite_out;
	output [2:0]StateID;

	controller   __controller(clk, compare, IRout, Mux1_alu_B, Mux2_alu_A, Mux3_RF_wen, Mux4_RF_wadd, Mux5_RF_read2,
							  Mux6_RF_dataIn, counter, Mux8_memwrite, Mux9_memDataIn, CZ_en, ALU_op, memread, wIR, wAtmp, 
				              StateID);
	datapath 	 __datapath(clk, Mux1_alu_B, Mux2_alu_A, Mux3_RF_wen, Mux4_RF_wadd, Mux5_RF_read2,
				            Mux6_RF_dataIn, Mux8_memwrite, Mux9_memDataIn, CZ_en, ALU_op, wIR, wAtmp, 
				            counter, compare, T1out, Mux9_memDataIn_out, memDataOut, Mux8_memwrite_out, IRout);
	memory 		 __mem(T1out[5:0], Mux9_memDataIn_out, memDataOut, Mux8_memwrite_out, memread, clk);

endmodule