library verilog;
use verilog.vl_types.all;
entity reg16_file is
    port(
        clk             : in     vl_logic;
        proc_rst        : in     vl_logic;
        out1            : out    vl_logic_vector(15 downto 0);
        out2            : out    vl_logic_vector(15 downto 0);
        readAdd1        : in     vl_logic_vector(2 downto 0);
        readAdd2        : in     vl_logic_vector(2 downto 0);
        write           : in     vl_logic;
        write_select    : in     vl_logic_vector(2 downto 0);
        \in\            : in     vl_logic_vector(15 downto 0);
        reset           : in     vl_logic
    );
end reg16_file;
