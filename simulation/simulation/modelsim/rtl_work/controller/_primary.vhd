library verilog;
use verilog.vl_types.all;
entity controller is
    generic(
        halt0           : vl_logic_vector(0 to 5) := (Hi1, Hi1, Hi1, Hi1, Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        proc_rst        : in     vl_logic;
        compare         : in     vl_logic;
        IR              : in     vl_logic_vector(15 downto 0);
        Mux1_alu_B      : out    vl_logic_vector(2 downto 0);
        Mux2_alu_A      : out    vl_logic_vector(2 downto 0);
        Mux3_RF_wen     : out    vl_logic_vector(1 downto 0);
        Mux4_RF_wadd    : out    vl_logic_vector(2 downto 0);
        Mux5_RF_read2   : out    vl_logic_vector(1 downto 0);
        Mux6_RF_dataIn  : out    vl_logic;
        counter         : out    vl_logic_vector(2 downto 0);
        Mux8_memwrite   : out    vl_logic_vector(1 downto 0);
        Mux9_memDataIn  : out    vl_logic;
        CZ_en           : out    vl_logic;
        ALU_op          : out    vl_logic;
        memread         : out    vl_logic;
        wIR             : out    vl_logic;
        wAtmp           : out    vl_logic;
        StateID         : out    vl_logic_vector(5 downto 0);
        T1write         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of halt0 : constant is 1;
end controller;
