module memory(address,in,out,write,read,clk, proc_rst);
	
	input [15:0] in;
	input clk,write,read, proc_rst;
	input [4:0] address;
	output reg [15:0] out;
	reg [15:0] mem [0:31];

	/*initial
		begin
			mem[0] <= 16'b0000001011110000;
			mem[1] <= 16'b0010001011101000;
		end*/
	
	always @(negedge clk)
		begin
		if(proc_rst==0) begin
				mem[0] <= 16'b0000001011110000;
				mem[1] <= 16'b0010001011101000;
				mem[2] <= 16'b0000001011110010;
			end
		if(write ==1'b0)
			begin
				mem[address] <= in;
			end
		if(read == 1'b0)
			begin
				out <= mem[address];
			end 
		end	

endmodule

// module mem16(address, write,clk, in, out,ir14);
// 	input [15:0] in;
// 	input [15:0] address;
// 	input write,clk,ir14;
// 	output reg [15:0] out;
// 	reg wreven,wrodd;
// 	reg[15:0] addreg;
	
// 	always @(*)
// 		begin
// 			addreg<= address;
// 		end

// 	reg [7:0] outeven,outodd,ineven,inodd;
// 	memory even(.address(address[15:1]),.in(ineven),.out(outeven),.clk(clk),.write(wreven));
// 	memory odd (.address(address[15:1]),.in(ineven),.out(outeven),.clk(clk),.write(wrodd));
// 	//for in signals of individual memories
// 	always @(*)
// 		begin
// 		if(ir14==0)
// 			begin
// 				ineven<=in;
// 				inodd<=in;
// 			end
// 		else 
// 			begin
// 				ineven<= in[7:0];
// 				inodd<=in[15:8];
// 			end
// 		end
// 	//-----------------------------------------------

// 	//for out signals of indicidual memories
// 	always @(*)
// 		begin
// 			if(ir14 ==1'b1)
// 				begin
// 					out[15:8]<=outodd;
// 					out[7:0]<=outeven;
// 				end
// 			else 
// 				if(addreg[0]==0)
// 					begin
// 						out<= {{8{outeven[7]}},outeven[7:0]};
// 					end
// 				else 
// 					begin
// 						out<= {{8{outodd[7]}},outodd[7:0]};
// 					end
// 		end

// 	//-------------------------------------------------

// 	//for write signal

// 	always @(*)
// 	begin
// 		if(ir14==0&&addreg[0]==1'b1)
// 			begin
// 				wreven<=1'b1;
// 			end
// 		else
// 			begin
// 				wreven<=write;
// 			end
// 	end

// 	always @(*)
// 	begin
// 		if(ir14==0&&addreg[0]==1'b0)
// 			begin
// 				wrodd<=1'b1;
// 			end
// 		else
// 			begin
// 				wrodd<=write;
// 			end
// 	end
// endmodule
