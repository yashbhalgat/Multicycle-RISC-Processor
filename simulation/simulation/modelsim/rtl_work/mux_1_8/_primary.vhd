library verilog;
use verilog.vl_types.all;
entity mux_1_8 is
    port(
        inp0            : in     vl_logic;
        inp1            : in     vl_logic;
        inp2            : in     vl_logic;
        inp3            : in     vl_logic;
        inp4            : in     vl_logic;
        inp5            : in     vl_logic;
        inp6            : in     vl_logic;
        inp7            : in     vl_logic;
        sel             : in     vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic
    );
end mux_1_8;
