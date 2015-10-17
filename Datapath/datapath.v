module datapath()

	wire [15:0] ALU_in1, ALU_in2, ALU_out;
	reg  [15:0] A,B;		

	reg16_file 		__RF(clk, RFout1, RFout2, RFReadAdd1, RFReadAdd2, RFwriteAdd, RFDataIn, RFreset);
	alu 			__alu(ALU_in1, ALU_in2, ALU_op, compare, carry, ALU_out, zero, pos, neg);
	memory 			__mem(memAdd, memDataIn, memDataOut, memWrite, memRead, clk);
	reg16 			__IR(clk, IRout, IRin, wIR, resetIR);
	reg16			__T1(clk, T1out, T1in, wT1, resetT1);
	reg16			__tmpA(clk, tmpAout, tmpAin, wtmpA, resettmpA);

	mux_16_8 		__Mux1_alu_B(16'd0, 16'd1, );


	assign wT1 = 1'b0;
	assign resetIR = 1'b1;
	assign resetT1 = 1'b1;
	assign resettmpA = 1'b1;
	assign RFReadAdd1 = IRout[11:9];
	assign tmpAin = RFout1;

	always@*
		begin
			A <= RFout1;
			B <= RFout2;
		end

endmodule