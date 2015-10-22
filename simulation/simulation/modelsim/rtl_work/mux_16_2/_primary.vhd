library verilog;
use verilog.vl_types.all;
entity mux_16_2 is
    port(
        inp0            : in     vl_logic_vector(15 downto 0);
        inp1            : in     vl_logic_vector(15 downto 0);
        sel             : in     vl_logic;
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end mux_16_2;
