/*
* Module : Active low Write Register Files.
*/

module reg16_file(clk, proc_rst, out1, out2, readAdd1, readAdd2, write, write_select, in, reset);

	output [15:0] out1, out2;
	input  [15:0] in;
	input  [2:0]  readAdd1, readAdd2, write_select;
	input         write, clk, reset, proc_rst;
	
	wire [15:0] reg_data0,  reg_data1,  reg_data2,  reg_data3,  reg_data4,  reg_data5,  reg_data6,  reg_data7;
	wire [7:0]  write_line_enable, write_reg_enable;
	
	demux_8 __demux(write_select, write_line_enable);
	mux_16_8 __mux1(reg_data0, reg_data1, reg_data2, reg_data3, reg_data4, reg_data5, reg_data6, reg_data7, readAdd1, out1);
	mux_16_8 __mux2(reg_data0, reg_data1, reg_data2, reg_data3, reg_data4, reg_data5, reg_data6, reg_data7, readAdd2, out2);
	
	or a0(write_reg_enable[0], write, ~write_line_enable[0]);
	or a1(write_reg_enable[1], write, ~write_line_enable[1]);
	or a2(write_reg_enable[2], write, ~write_line_enable[2]);
	or a3(write_reg_enable[3], write, ~write_line_enable[3]);
	or a4(write_reg_enable[4], write, ~write_line_enable[4]);
	or a5(write_reg_enable[5], write, ~write_line_enable[5]);
	or a6(write_reg_enable[6], write, ~write_line_enable[6]);
	or a7(write_reg_enable[7], write, ~write_line_enable[7]);
	
	reg16 r0(clk, reg_data0, in, write_reg_enable[0], reset, proc_rst);
	reg16 r1(clk, reg_data1, in, write_reg_enable[1], reset, proc_rst);
	reg16 r2(clk, reg_data2, in, write_reg_enable[2], reset, proc_rst);
	reg16 r3(clk, reg_data3, in, write_reg_enable[3], reset, proc_rst);
	reg16 r4(clk, reg_data4, in, write_reg_enable[4], reset, proc_rst);
	reg16 r5(clk, reg_data5, in, write_reg_enable[5], reset, proc_rst);
	reg16 r6(clk, reg_data6, in, write_reg_enable[6], reset, proc_rst);
	reg16 r7(clk, reg_data7, in, write_reg_enable[7], reset, proc_rst);
	
endmodule
