module controller(clk, proc_rst, compare, IR, Mux1_alu_B, Mux2_alu_A, Mux3_RF_wen, Mux4_RF_wadd, Mux5_RF_read2,
				Mux6_RF_dataIn, counter, Mux8_memwrite, Mux9_memDataIn, CZ_en, ALU_op, memread, wIR, wAtmp, 
				StateID, T1write);

	input             clk, proc_rst, compare;
	input      [15:0] IR;
	output reg [2:0]  Mux1_alu_B;
	output reg [2:0]  Mux2_alu_A;
	output reg [1:0]  Mux3_RF_wen;
	output reg [2:0]  Mux4_RF_wadd;
	output reg [1:0]  Mux5_RF_read2;
	output reg 		  Mux6_RF_dataIn;
	output reg [1:0]  Mux8_memwrite;
	output reg 		  Mux9_memDataIn;
	output reg        ALU_op,CZ_en, T1write;
	output reg        memread,wIR,wAtmp; 
	output reg [2:0]  counter;
	output reg 	   [5:0]  StateID;

	
	always@(negedge clk)
		begin
			if(proc_rst==0) begin
				T1write = 1'b1;
			end
			else begin
				case(StateID)
					0:begin
						wIR <= 0;
						memread <=0;
						Mux8_memwrite <=2'b01;
						ALU_op = 0;
						CZ_en = 1'b1;
						counter <= 3'b000;
					end	
					//in any state after state 0, u have to make T1write<=0;
					
					1:begin
						T1write <= 1'b0;
						Mux1_alu_B <= 3'b010;
						Mux2_alu_A <= 3'b101;
						Mux5_RF_read2 <= 2'b00;
						CZ_en = 1'b1;
						ALU_op = 0;
						// Mux4_RF_wadd <= 2'b00;
					end

					2:begin
						wIR <= 1'b1;
						// Mux1_alu_B <= 3'b010;
						// Mux2_alu_A <= 3'b001;
						Mux3_RF_wen <= 2'b00;
						Mux4_RF_wadd <= 3'b001;
						// Mux5_RF_read2 <= 2'b10; 
						Mux6_RF_dataIn <= 1'b1;
						ALU_op = 0;
						CZ_en = 0;
					end

					3:begin
						ALU_op = 0;
						Mux1_alu_B <= 3'b010;
						Mux2_alu_A <= 3'b001;
						Mux5_RF_read2 <= 2'b10;	 
						CZ_en = 1'b1;
					end

					4:begin
						Mux3_RF_wen <= 2'b00;
						Mux4_RF_wadd <= 3'b011;
						// Mux5_RF_read2 <= 2'b10; 
						Mux6_RF_dataIn <= 1'b1;					
						ALU_op = 0;
						CZ_en = 1'b1;
					end

					5:begin
						Mux3_RF_wen <= 2'b10;
						Mux4_RF_wadd <= 3'b001;
						// Mux5_RF_read2 <= 2'b10; 
						Mux6_RF_dataIn <= 1'b1;
						ALU_op = 0;
						CZ_en = 1'b1;
					end

					6:begin
						// Mux1_alu_B <= 3'b010;
						// Mux2_alu_A <= 3'b001;
						Mux3_RF_wen <= 2'b10;
						Mux4_RF_wadd <= 3'b001;
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
						Mux1_alu_B <= 3'b010;
						Mux2_alu_A <= 3'b101;
						Mux5_RF_read2 <= 2'b00;
						CZ_en = 1'b1;
						ALU_op = 1'b1;
						// Mux4_RF_wadd <= 2'b00;
					end

					9:begin
						// Mux1_alu_B <= 3'b010;
						// Mux2_alu_A <= 3'b001;
						Mux3_RF_wen <= 2'b00;
						Mux4_RF_wadd <= 3'b001;
						// Mux5_RF_read2 <= 2'b10; 
						Mux6_RF_dataIn <= 1'b1;
						ALU_op = 1'b1;
						CZ_en = 0;
					end

					10:begin
						Mux3_RF_wen <= 2'b10;
						Mux4_RF_wadd <= 3'b001;
						// Mux5_RF_read2 <= 2'b10; 
						Mux6_RF_dataIn <= 1'b1;
						ALU_op = 1'b1;
						CZ_en = 1'b1;
					end

					11:begin
						Mux1_alu_B <= 3'b011;
						Mux2_alu_A <= 3'b101;
						CZ_en = 1'b1;
						ALU_op = 0;
						// Mux4_RF_wadd <= 2'b00;
					end

					12:begin
						// Mux1_alu_B <= 3'b010;
						// Mux2_alu_A <= 3'b001;
						Mux3_RF_wen <= 2'b00;
						Mux4_RF_wadd <= 3'b100;
						// Mux5_RF_read2 <= 2'b10; 
						Mux6_RF_dataIn <= 1'b1;
						ALU_op = 0;
						CZ_en = 0;
					end

					13:begin
						Mux1_alu_B <= 3'b000;
						Mux2_alu_A <= 3'b010;
						CZ_en =1'b1;
						ALU_op =0;
					end

					14:begin
						Mux3_RF_wen <= 2'b00;
						Mux4_RF_wadd <= 3'b000;
						// Mux5_RF_read2 <= 2'b10; 
						Mux6_RF_dataIn <= 1'b1;
						ALU_op = 0;
						CZ_en = 0;
					end

					15:begin
						Mux1_alu_B <= 3'b010;
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
						Mux1_alu_B <= 3'b000;
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
						Mux1_alu_B <= 3'b010;
						CZ_en <= 1;
						ALU_op <= 0;					
					end

					// Same as 22 
					23:begin
						Mux2_alu_A <= 3'b101;
						Mux1_alu_B <= 3'b010;
						CZ_en <= 1;
						ALU_op <= 0;
					end

					24:begin
						Mux1_alu_B <= 3'b010;
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
						Mux1_alu_B <= 3'b010;
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
						Mux1_alu_B <= 3'b010;
						Mux2_alu_A <= 3'b000;
						Mux5_RF_read2 <= 2'b00;
					end

					29:begin
						ALU_op = 0;
						CZ_en = 1'b1;
						Mux1_alu_B <= 3'b010;
						Mux2_alu_A <= 3'b000;
						Mux5_RF_read2 <= 2'b00;
						Mux3_RF_wen <= 2'b00;
						Mux4_RF_wadd <= 3'b011;
						// Mux5_RF_read2 <= 2'b10; 
						Mux6_RF_dataIn <= 1'b1;						 
					end

					30:begin
						Mux1_alu_B <= 3'b100;
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
						Mux1_alu_B <= 3'b100;
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
			endcase
		end
	end

	always@(negedge clk)
		begin
			if(proc_rst==0) begin
				StateID = 6'd0;
			end
			else begin
				case (StateID)
					0:begin
							case (IR[15:12])
							0: StateID=1;
							1: StateID=11;
							2: StateID=8;
							3: StateID=20;
							4: StateID=15;
							5: StateID=15;
							6: StateID=30;
							7: StateID=34;
							8: StateID=3;
							9: StateID=3;
							12: StateID=22;
							endcase
					  end
					1:begin
							case (IR[1:0])
							0: StateID=2;
							1: StateID=5;
							2: StateID=5;
							default: StateID=0;
							endcase
					  end 
					2: StateID=3;
					3:begin
							case (IR[15:12])
							8: StateID=25;
							9: StateID=25;
							default: StateID=4;
							endcase
					  end
					4: StateID=0;
					5: StateID=6;
					6: StateID=7;
					7: StateID=3;
					8:begin
							case (IR[1:0])
							0: StateID=9;
							1: StateID=10;
							2: StateID=10;
							default: StateID = 0;
							endcase
					  end
					9: StateID=3;
					10: StateID=6;
					11: StateID=12;
					12: StateID=3;
					13: StateID=14;
					14: StateID=3;
					15:begin
							case (IR[15:12])
							4: StateID=18;
							5: StateID=16;
							default: StateID=0;
							endcase
					  end
					16: StateID=17;
					17: StateID=3;
					18: StateID=19;
					19: StateID=3;
					20: StateID=21;
					21: StateID=3;
					22: StateID=23;
					23:begin
							case (compare)
							0: StateID=3;
							1: StateID=24;
							endcase
					  end
					24: StateID=4;
					25:begin
							case (IR[15:12])
							8: StateID=26;
							9: StateID=28;
							default: StateID=0;
							endcase
					  end
					26: StateID=27;
					27: StateID=4;
					28: StateID=29;
					29: StateID=4;
					30: StateID=31;
					31: StateID=32;
					32: StateID=33;
					33: if(counter==3'b111) StateID=3;
										  else StateID=30;
					34: StateID=35;
					35: StateID=36;
					36: StateID=37;
					37: if(counter==3'b111) StateID=3;
										  else StateID=34;
					default: StateID=0;
				endcase
			end

				// if state 23 compare = 1 then goto 24 otherwise goto 3
			
		end
endmodule