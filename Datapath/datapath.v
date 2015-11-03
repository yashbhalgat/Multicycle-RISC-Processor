module datapath(clk, proc_rst, Mux1_alu_B, Mux2_alu_A, Mux3_RF_wen, Mux4_RF_wadd, Mux5_RF_read2,
				Mux6_RF_dataIn, Mux8_memwrite, Mux9_memDataIn, CZ_en, ALU_op, wIR, wAtmp, T1write, 
			   counter, compare, T1out, Mux9_memDataIn_out, memDataOut, Mux8_memwrite_out, IRout,Mux7_RF_write_out,lm_sm_wadd);

	input 		  clk, proc_rst, wIR, wAtmp;
	input [2:0]   Mux1_alu_B;
	input [2:0]   Mux2_alu_A;
	input [1:0]   Mux3_RF_wen;
	input [2:0]   Mux4_RF_wadd;
	input [1:0]   Mux5_RF_read2;
	input 		  Mux6_RF_dataIn;
	input [1:0]   Mux8_memwrite;
	input 		  Mux9_memDataIn;
	input         ALU_op,CZ_en, T1write;
	input [2:0]   counter, lm_sm_wadd;
	input [15:0]  memDataOut;	

	output 		  compare;
	output [15:0] T1out;
	output [15:0] Mux9_memDataIn_out, IRout;	
	output 		  Mux8_memwrite_out;
	output wire   Mux7_RF_write_out;

	wire [15:0] ALU_out, tmpAout;
	wire [15:0] RFout1, RFout2, Mux6_RF_dataIn_out, Mux1_alu_B_out, Mux2_alu_A_out, imm6Out, imm9Out, shift7Out;
	wire [2:0]  Mux4_RF_wadd_out, Mux5_RF_read2_out;
	wire        Mux3_RF_wen_out, /*Mux7_RF_write_out,*/ CZout, carry, zero;

	reg  [15:0] A,B;

	reg16_file 		__RF(clk, proc_rst, RFout1, RFout2, IRout[11:9], Mux5_RF_read2_out, Mux3_RF_wen_out, Mux4_RF_wadd_out, Mux6_RF_dataIn_out, 1'b1);
	alu 			__alu(Mux1_alu_B_out, Mux2_alu_A_out, ALU_op, compare, carry, ALU_out, zero);
	// memory 			__mem(T1out, Mux9_memDataIn_out, memDataOut, Mux8_memwrite_out, memRead, clk);
	
	CZ_reg			__CZ(IRout[1:0],carry, zero, CZ_en, CZout);
	IRreg16 			__IR(clk, IRout, memDataOut, wIR, 1'b1);
	T1reg16			__T1(clk, T1out, ALU_out, T1write, 1'b1, proc_rst);
	reg16			__tmpA(clk, tmpAout, RFout1, wAtmp, 1'b1,proc_rst);
	
	imm_6			__imm6(IRout[5:0], imm6Out);
	imm_9			__imm9(IRout[8:0], imm9Out);
	shift_7			__shift7(IRout[8:0], shift7Out);
		
	mux_16_8 		__Mux1_alu_B(16'd0, 16'd1, B, imm6Out, {{13{1'b0}},counter}, 16'd0, 16'd0, 16'd0, Mux1_alu_B, Mux1_alu_B_out);
	mux_16_8 		__Mux2_alu_A(16'd0, 16'd1, shift7Out, imm6Out, imm9Out, A, tmpAout, 16'd0, Mux2_alu_A, Mux2_alu_A_out);
	mux_1_4			__Mux3_RF_wen(1'b0,1'b1,CZout,Mux7_RF_write_out, Mux3_RF_wen, Mux3_RF_wen_out);
	mux_3_8		    __Mux4_RF_wadd(IRout[11:9],IRout[5:3],lm_sm_wadd,3'b111,IRout[8:6],3'b000,3'b000,3'b000,Mux4_RF_wadd,Mux4_RF_wadd_out);
	mux_3_4			__Mux5_RF_read2(IRout[8:6],lm_sm_wadd,3'b111,3'b000,Mux5_RF_read2,Mux5_RF_read2_out);
	mux_16_2		__Mux6_RF_dataIn(memDataOut, T1out, Mux6_RF_dataIn, Mux6_RF_dataIn_out);
	mux_1_8			__Mux7_RF_write(~IRout[7],~IRout[6],~IRout[5],~IRout[4],~IRout[3],~IRout[2],~IRout[1],~IRout[0],counter,Mux7_RF_write_out);
	mux_1_4			__Mux8_memwrite(1'b0,1'b1,Mux7_RF_write_out,1'b0, Mux8_memwrite, Mux8_memwrite_out);
	mux_16_2		__Mux9_memDataIn(A,B, Mux9_memDataIn, Mux9_memDataIn_out);		

	// assign wT1 = 1'b0;
	// assign tmpAin = RFout1;
	// assign imm6In = IRout[5:0];
	// assign imm9In = IRout[8:0];
	// assign shift7In = IRout[8:0];
	
	always@*
		begin
			A <= RFout1;
			B <= RFout2;
		end

endmodule