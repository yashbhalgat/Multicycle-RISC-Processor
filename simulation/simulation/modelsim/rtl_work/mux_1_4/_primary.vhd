library verilog;
use verilog.vl_types.all;
entity mux_1_4 is
    port(
        inp0            : in     vl_logic;
        inp1            : in     vl_logic;
        inp2            : in     vl_logic;
        inp3            : in     vl_logic;
        sel             : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic
    );
end mux_1_4;
