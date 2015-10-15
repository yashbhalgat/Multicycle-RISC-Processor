module memory(address,in,out,write,clk);
	
	input [7:0] in;
	input clk,write;
	input [14:0] address;
	output  [7:0] out;
	reg [7:0] mem [0:255];
	reg [14:0] addreg;

	always @(negedge clk)
		begin
		if(write ==1'b0)
			begin
				mem[address] <= in;
				addreg <= address;
			end
		end

	assign out = mem[addreg];	

endmodule

module mem16(address, write,clk, in, out,ir14);
	input [15:0] in;
	input [15:0] address;
	input write,clk,ir14;
	output reg [15:0] out;
	reg wreven,wrodd;
	reg[15:0] addreg;
	
	always @(*)
		begin
			addreg<= address;
		end

	reg [7:0] outeven,outodd,ineven,inodd;
	memory even(.address(address[15:1]),.in(ineven),.out(outeven),.clk(clk),.write(wreven));
	memory odd (.address(address[15:1]),.in(ineven),.out(outeven),.clk(clk),.write(wrodd));
	//for in signals of individual memories
	always @(*)
		begin
		if(ir14==0)
			begin
				ineven<=in;
				inodd<=in;
			end
		else 
			begin
				ineven<= in[7:0];
				inodd<=in[15:8];
			end
		end
	//-----------------------------------------------

	//for out signals of indicidual memories
	always @(*)
		begin
			if(ir14 ==1'b1)
				begin
					out[15:8]<=outodd;
					out[7:0]<=outeven;
				end
			else 
				if(addreg[0]==0)
					begin
						out<= {{8{outeven[7]}},outeven[7:0]};
					end
				else 
					begin
						out<= {{8{outodd[7]}},outodd[7:0]};
					end
		end

	//-------------------------------------------------

	//for write signal

	always @(*)
	begin
		if(ir14==0&&addreg[0]==1'b1)
			begin
				wreven<=1'b1;
			end
		else
			begin
				wreven<=write;
			end
	end

	always @(*)
	begin
		if(ir14==0&&addreg[0]==1'b0)
			begin
				wrodd<=1'b1;
			end
		else
			begin
				wrodd<=write;
			end
	end
endmodule
