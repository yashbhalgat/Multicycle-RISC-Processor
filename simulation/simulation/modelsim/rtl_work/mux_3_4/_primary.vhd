library verilog;
use verilog.vl_types.all;
entity mux_3_4 is
    port(
        inp0            : in     vl_logic_vector(2 downto 0);
        inp1            : in     vl_logic_vector(2 downto 0);
        inp2            : in     vl_logic_vector(2 downto 0);
        inp3            : in     vl_logic_vector(2 downto 0);
        sel             : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(2 downto 0)
    );
end mux_3_4;
