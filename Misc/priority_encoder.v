module priority_encoder(enable, imm8, firstOnePosition);
	
	input enable;
	input [7:0] imm8;
	output reg [2:0] firstOnePosition;
	// firstOnePosition = 0;
   	
	always@(negedge enable)
		begin
		   	if(imm8[0] == 1'b1) 
		   		begin
		    		firstOnePosition = 0; 
		   		end 
			else if(imm8[1] == 1) 
		   		begin
		    		firstOnePosition = 1; 
		   		end 
			else if(imm8[2] == 1) 
		   		begin
		    		firstOnePosition = 2; 
		   		end
		   	else if(imm8[3] == 1) 
		   		begin
		    		firstOnePosition = 3; 
		   		end	
		 	else if(imm8[4] == 1) 
		   		begin
		    		firstOnePosition = 4; 
		   		end
		   	else if(imm8[5] == 1) 
		   		begin
		    		firstOnePosition = 5; 
		   		end
		   	else if(imm8[6] == 1) 
		   		begin
		    		firstOnePosition = 6; 
		   		end
		   	else if(imm8[7] == 1) 
		   		begin
		    		firstOnePosition = 7; 
		   		end
		   end
endmodule