module controller(clk, StateID,);

	input             clk, compare;
	input      [15:0] IR;
	output reg [1:0]  Mux1_alu_B;
	output reg [2:0]  Mux2_alu_A;
	output reg [1:0]  Mux3_RF_wen;
	output reg [2:0]  Mux4_RF_wadd;
	output reg [1:0]  Mux5_RF_read2;
	output reg 		  Mux6_RF_dataIn;
	output reg [1:0]  Mux7_RF_read2;
	output reg [1:0]  Mux8_memwrite;
	output reg 		  Mux9_memDataIn;
	output reg        count_enable, ALU_op,CZ_en;
	output reg        memread,wIR,wRF,wAtmp; 
	reg 	   [2:0]  counter;
	always(@negedge clk)
		begin
			case(StateID)
				0:begin
					wIR <= 0;
					memread <=0;
					Mux8_memwrite <=2'b01;
					ALU_op = 0;
					CZ_en = 1'b1;
					counter <= 3'b000;
				end	

				1:begin
					Mux1_alu_B <= 2'b10;
					Mux2_alu_A <= 3'b101;
					Mux5_RF_read2 <= 2'b00;
					CZ_en = 1'b1;
					ALU_op = 0;
					// Mux4_RF_wadd <= 2'b00;
				end

				2:begin
					// Mux1_alu_B <= 2'b10;
					// Mux2_alu_A <= 3'b001;
					Mux3_RF_wen <= 2'b00;
					Mux4_RF_wadd <= 2'b001;
					// Mux5_RF_read2 <= 2'b10; 
					Mux6_RF_dataIn <= 1'b1;
					ALU_op = 0;
					CZ_en = 0;
				end

				3:begin
					ALU_op = 0;
					Mux1_alu_B <= 2'b10;
					Mux2_alu_A <= 3'b001;
					Mux5_RF_read2 <= 2'b10;	 
					CZ_en = 1'b1;
				end

				4:begin
					Mux3_RF_wen <= 2'b00;
					Mux4_RF_wadd <= 2'b011;
					// Mux5_RF_read2 <= 2'b10; 
					Mux6_RF_dataIn <= 1'b1;					
					ALU_op = 0;
					CZ_en = 1'b1;
				end

				5:begin
					Mux3_RF_wen <= 2'b10;
					Mux4_RF_wadd <= 2'b001;
					// Mux5_RF_read2 <= 2'b10; 
					Mux6_RF_dataIn <= 1'b1;
					ALU_op = 0;
					CZ_en = 1'b1;
				end

				6:begin
					// Mux1_alu_B <= 2'b10;
					// Mux2_alu_A <= 3'b001;
					Mux3_RF_wen <= 2'b10;
					Mux4_RF_wadd <= 2'b001;
					// Mux4_RF_wadd <= 2'b01;
					// // Mux5_RF_read2 <= 2'b10; 
					// Mux6_RF_dataIn <= 1'b1;
					// ALU_op = 0;
					CZ_en = 1'b1;
				end

				7:begin
					CZ_en <= 0;
					Mux3_RF_wen <= 2'b01;
				end

				8:begin
					Mux1_alu_B <= 2'b10;
					Mux2_alu_A <= 3'b101;
					Mux5_RF_read2 <= 2'b00;
					CZ_en = 1'b1;
					ALU_op = 1'b1;
					// Mux4_RF_wadd <= 2'b00;
				end

				9:begin
					// Mux1_alu_B <= 2'b10;
					// Mux2_alu_A <= 3'b001;
					Mux3_RF_wen <= 2'b00;
					Mux4_RF_wadd <= 2'b001;
					// Mux5_RF_read2 <= 2'b10; 
					Mux6_RF_dataIn <= 1'b1;
					ALU_op = 1'b1;
					CZ_en = 0;
				end

				10:begin
					Mux3_RF_wen <= 2'b10;
					Mux4_RF_wadd <= 2'b001;
					// Mux5_RF_read2 <= 2'b10; 
					Mux6_RF_dataIn <= 1'b1;
					ALU_op = 1'b1;
					CZ_en = 1'b1;
				end

				11:begin
					Mux1_alu_B <= 2'b11;
					Mux2_alu_A <= 3'b101;
					CZ_en = 1'b1;
					ALU_op = 0;
					// Mux4_RF_wadd <= 2'b00;
				end

				12:begin
					// Mux1_alu_B <= 2'b10;
					// Mux2_alu_A <= 3'b001;
					Mux3_RF_wen <= 2'b00;
					Mux4_RF_wadd <= 2'b100;
					// Mux5_RF_read2 <= 2'b10; 
					Mux6_RF_dataIn <= 1'b1;
					ALU_op = 0;
					CZ_en = 0;
				end

				13:begin
					Mux1_alu_B <= 2'b00;
					Mux2_alu_A <= 3'b010;
					CZ_en =1'b1;
					ALU_op =0;
				end

				14:begin
					Mux3_RF_wen <= 2'b00;
					Mux4_RF_wadd <= 2'b000;
					// Mux5_RF_read2 <= 2'b10; 
					Mux6_RF_dataIn <= 1'b1;
					ALU_op = 0;
					CZ_en = 0;
				end

				15:begin
					Mux1_alu_B <= 2'b10;
					Mux2_alu_A <= 3'b011;
					Mux5_RF_read2 <= 2'b00;
					Mux9_memDataIn <= 1'b0;
					CZ_en = 1'b1;
					ALU_op = 0;
				end

				16:begin
					Mux9_memDataIn <= 1'b0;
					Mux8_memwrite = 2'b00;
					CZ_en <= 1;
				end

				17:begin
					Mux8_memwrite = 2'b00;
					Mux9_memDataIn <= 1'b0;
					CZ_en <= 1;
				end

				18:begin
					memread <= 0;
					CZ_en <= 1;
				end

				19:begin
					Mux6_RF_dataIn <= 1'b0;
					Mux3_RF_wen <= 2'b00;
					Mux4_RF_wadd <= 3'b000;
				end

				20:begin
					Mux2_alu_A <= 3'b010;
					Mux1_alu_B <= 2'b00;
					CZ_en <= 1;
					ALU_op <= 0;
				end

				21:begin
					Mux3_RF_wen <= 2'b00;
					Mux4_RF_wadd <= 2'b00;
					Mux6_RF_dataIn <= 1'b1;
				end

				22:begin
					Mux2_alu_A <= 3'b101;
					Mux1_alu_B <= 2'b10;
					CZ_en <= 1;
					ALU_op <= 0;					
				end

				// Same as 22 
				23:begin
					Mux2_alu_A <= 3'b101;
					Mux1_alu_B <= 2'b10;
					CZ_en <= 1;
					ALU_op <= 0;
				end

				24:begin
					Mux1_alu_B <= 2'b10;
					Mux2_alu_A <= 3'b011;
					Mux5_RF_read2 <= 2'b10;
					CZ_en = 1;
					ALU_op = 0;
				end

				25:begin
					Mux3_RF_wen <= 2'b00;
					Mux4_RF_wadd <= 3'b000;
					// Mux5_RF_read2 <= 2'b10; 
					Mux6_RF_dataIn <= 1'b1;					
					ALU_op = 0;
					CZ_en = 1'b1;
				end

				26:begin
					ALU_op = 0;
					Mux1_alu_B <= 2'b10;
					Mux2_alu_A <= 3'b011;
					Mux5_RF_read2 <= 2'b10;	 
					CZ_en = 1'b1;
				end

				27:begin
					ALU_op = 0;
					CZ_en = 1'b1;
					Mux3_RF_wen <= 2'b00;
					Mux4_RF_wadd <= 3'b011;
					// Mux5_RF_read2 <= 2'b10; 
					Mux6_RF_dataIn <= 1'b1;
				end

				28:begin
					ALU_op = 0;
					CZ_en = 1'b1;
					Mux1_alu_B <= 2'b10;
					Mux2_alu_A <= 3'b000;
					Mux5_RF_read2 <= 2'b00;
				end

				29:begin
					ALU_op = 0;
					CZ_en = 1'b1;
					Mux1_alu_B <= 2'b10;
					Mux2_alu_A <= 3'b000;
					Mux5_RF_read2 <= 2'b00;
					Mux3_RF_wen <= 2'b00;
					Mux4_RF_wadd <= 2'b011;
					// Mux5_RF_read2 <= 2'b10; 
					Mux6_RF_dataIn <= 1'b1;						 
				end

				30:begin
					Mux1_alu_B <= 2'b100;
					Mux2_alu_A <= 3'b110;
					wAtmp <= 0;
					Mux6_RF_dataIn <= 0;
					Mux3_RF_wen <= 2'b11;
					Mux4_RF_wadd <= 3'b010;
				end

				31:begin
					Mux3_RF_wen <= 2'b11;
					Mux4_RF_wadd <= 3'b010;
					Mux6_RF_dataIn <= 0;
				end

				32:begin
					wAtmp <= 1;
				end

				33:begin
					counter <= counter +3'b001;
				end

				34:begin
					Mux1_alu_B <= 2'b100;
					Mux2_alu_A <= 3'b110;
					wAtmp <= 0;
					Mux5_RF_read2 <= 2'b01;
					Mux3_RF_wen <= 2'b01;
					Mux8_memwrite <= 2'b01;
					Mux9_memDataIn <= 1'b1;
				end

				35:begin
					
				end

				36:begin
					Mux8_memwrite <= 2'b10;
				end

				37:begin
					counter <= counter + 3'b001;
				end

		end

	always(@negedge clk)
		begin
				// if state 23 compare = 1 then goto 24 otherwise goto 3
			end
		end

endmodule