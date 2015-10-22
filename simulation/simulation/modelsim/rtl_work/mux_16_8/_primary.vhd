library verilog;
use verilog.vl_types.all;
entity mux_16_8 is
    port(
        inp0            : in     vl_logic_vector(15 downto 0);
        inp1            : in     vl_logic_vector(15 downto 0);
        inp2            : in     vl_logic_vector(15 downto 0);
        inp3            : in     vl_logic_vector(15 downto 0);
        inp4            : in     vl_logic_vector(15 downto 0);
        inp5            : in     vl_logic_vector(15 downto 0);
        inp6            : in     vl_logic_vector(15 downto 0);
        inp7            : in     vl_logic_vector(15 downto 0);
        sel             : in     vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end mux_16_8;
