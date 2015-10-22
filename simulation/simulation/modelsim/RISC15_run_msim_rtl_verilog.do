transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Registers {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Registers/T1reg16.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/RISC15.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Registers {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Registers/reg16_file.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Registers {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Registers/reg16.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Registers {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Registers/CZ_reg.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/MUX {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/MUX/mux_16_8.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/MUX {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/MUX/mux_16_2.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/MUX {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/MUX/mux_3_8.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/MUX {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/MUX/mux_3_4.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/MUX {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/MUX/mux_1_8.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/MUX {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/MUX/mux_1_4.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Misc {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Misc/shift_7.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Misc {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Misc/imm_9.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Misc {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Misc/imm_6.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Memory {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Memory/memory.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/DEMUX {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/DEMUX/demux_8.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Datapath {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Datapath/datapath.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Controller {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/Controller/controller.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/ALU {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/ALU/nand16.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/ALU {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/ALU/carry_generate.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/ALU {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/ALU/alu.v}
vlog -vlog01compat -work work +incdir+/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/ALU {/home/meetshah1995/Desktop/Dropbox/Third_Year/EE337/Multicycle-RISC15-Design/ALU/add16.v}

