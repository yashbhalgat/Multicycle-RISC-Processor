library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        proc_rst        : in     vl_logic;
        Mux1_alu_B      : in     vl_logic_vector(2 downto 0);
        Mux2_alu_A      : in     vl_logic_vector(2 downto 0);
        Mux3_RF_wen     : in     vl_logic_vector(1 downto 0);
        Mux4_RF_wadd    : in     vl_logic_vector(2 downto 0);
        Mux5_RF_read2   : in     vl_logic_vector(1 downto 0);
        Mux6_RF_dataIn  : in     vl_logic;
        Mux8_memwrite   : in     vl_logic_vector(1 downto 0);
        Mux9_memDataIn  : in     vl_logic;
        CZ_en           : in     vl_logic;
        ALU_op          : in     vl_logic;
        wIR             : in     vl_logic;
        wAtmp           : in     vl_logic;
        T1write         : in     vl_logic;
        counter         : in     vl_logic_vector(2 downto 0);
        compare         : out    vl_logic;
        T1out           : out    vl_logic_vector(15 downto 0);
        Mux9_memDataIn_out: out    vl_logic_vector(15 downto 0);
        memDataOut      : in     vl_logic_vector(15 downto 0);
        Mux8_memwrite_out: out    vl_logic;
        IRout           : out    vl_logic_vector(15 downto 0)
    );
end datapath;
