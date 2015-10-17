module datapath(Mux1_alu_B, Mux2_alu_A, CZen )

	wire [15:0] ALU_in1, ALU_in2, ALU_out;
	reg  [15:0] A,B;		

	reg16_file 		__RF(clk, RFout1, RFout2, RFReadAdd1, RFReadAdd2, Mux3_RF_wen_out, RFwriteAdd, RFDataIn, RFreset);
	alu 			__alu(ALU_in1, ALU_in2, ALU_op, compare, carry, ALU_out, zero, pos, neg);
	memory 			__mem(memAdd, memDataIn, memDataOut, memWrite, memRead, clk);
	CZ_reg			__CZ(IRout[1:0],carry, zero, CZen, CZout);
	reg16 			__IR(clk, IRout, IRin, wIR, resetIR);
	reg16			__T1(clk, T1out, T1in, wT1, resetT1);
	reg16			__tmpA(clk, tmpAout, tmpAin, wtmpA, resettmpA);
	imm_6			__imm6(imm6In, imm6Out);
	imm_9			__imm9(imm9In, imm9Out);
	shift_7			__shift7(shift7In, shift7Out);
	mux_16_8 		__Mux1_alu_B(16'd0, 16'd1, B, imm6Out, {16{0},counter}, 16'd0, 16'd0, 16'd0, Mux1_alu_B, Mux1_alu_B_out);
	mux_16_8 		__Mux2_alu_A(16'd0, 16'd1, shift7Out, imm6Out, imm9Out, A, tmpAout, 16'd0, Mux2_alu_A, Mux2_alu_A_out);
	mux_1_4			__Mux3_RF_wen(1'b0,1'b1,CZout,Mux7_RF_write_out, Mux3_RF_wen, Mux3_RF_wen_out);
	mux_1_8			__Mux7_RF_write(IRout[7],IRout[6],IRout[5],IRout[4],IRout[3],IRout[2],IRout[1],IRout[0],counter,Mux7_RF_write_out);
	

	assign wT1 = 1'b0;
	assign resetIR = 1'b1;
	assign resetT1 = 1'b1;
	assign resettmpA = 1'b1;
	assign RFReadAdd1 = IRout[11:9];
	assign tmpAin = RFout1;
	assign imm6In = IRout[5:0];
	assign imm9In = IRout[8:0];
	assign shift7In = IRout[8:0];
	assign memAdd = T1out;


	always@*
		begin
			A <= RFout1;
			B <= RFout2;
		end

endmodule