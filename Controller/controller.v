module controller(clk, StateID,);

	input             clk;
	input      [15:0] IR;
	output reg [1:0]  Mux1_alu_B;
	output reg [2:0]  Mux2_alu_A;
	output reg [1:0]  Mux3_RF_wen;
	output reg [2:0]  Mux4_RF_wadd;
	output reg [1:0]  Mux5_RF_read2;
	output reg 		  Mux6_RF_dataIn;
	output reg [1:0]  Mux7_RF_read2;
	output reg        count_enable, ALU_op,CZ_en;
	output reg        memwrite,memread,wIR,wRF; 
	/*
	* States 
	* 0 - Fetches Instructions from T1
	* 1 - Pass regA to A ,regB to B, (A,B) to ALU
	* 2 - 
	* 3 - 
	*/


	always(@negedge clk)
		begin
			case(StateID)
				0:begin
					wIR <= 0;
					memread <=0;
					memwrite <=1;
					ALU_op = 0;
					CZ_en = 1;
				end	

				1:begin
					Mux1_alu_B <= 2'b10;
					Mux2_alu_A <= 3'b101;
					Mux5_RF_read2 <= 2'b00;
					CZ_en = 1;
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
					CZ_en = 1;
				end

				4:begin
					Mux3_RF_wen <= 2'b00;
					Mux4_RF_wadd <= 2'b011;
					// Mux5_RF_read2 <= 2'b10; 
					Mux6_RF_dataIn <= 1'b1;					
					ALU_op = 0;
					CZ_en = 1;
				end

				5:begin
					Mux3_RF_wen <= 2'b10;
					Mux4_RF_wadd <= 2'b001;
					// Mux5_RF_read2 <= 2'b10; 
					Mux6_RF_dataIn <= 1'b1;
					ALU_op = 0;
					CZ_en = 1;
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
					CZ_en = 1;
				end

				7:begin
					CZ_en <= 0;
					Mux3_RF_wen <= 2'b01;
				end

				8:begin
					Mux1_alu_B <= 2'b10;
					Mux2_alu_A <= 3'b101;
					Mux5_RF_read2 <= 2'b00;
					CZ_en = 1;
					ALU_op = 1;
					// Mux4_RF_wadd <= 2'b00;
				end

				9:begin
					// Mux1_alu_B <= 2'b10;
					// Mux2_alu_A <= 3'b001;
					Mux3_RF_wen <= 2'b00;
					Mux4_RF_wadd <= 2'b001;
					// Mux5_RF_read2 <= 2'b10; 
					Mux6_RF_dataIn <= 1'b1;
					ALU_op = 1;
					CZ_en = 0;
				end

				10:begin
					Mux3_RF_wen <= 2'b10;
					Mux4_RF_wadd <= 2'b001;
					// Mux5_RF_read2 <= 2'b10; 
					Mux6_RF_dataIn <= 1'b1;
					ALU_op = 1;
					CZ_en = 1;
				end

				11:begin
					Mux1_alu_B <= 2'b11;
					Mux2_alu_A <= 3'b101;
					CZ_en = 1;
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
					
				end
		end

endmodule