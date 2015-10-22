library verilog;
use verilog.vl_types.all;
entity T1reg16 is
    port(
        clk             : in     vl_logic;
        \out\           : out    vl_logic_vector(15 downto 0);
        \in\            : in     vl_logic_vector(15 downto 0);
        write           : in     vl_logic;
        reset           : in     vl_logic;
        proc_rst        : in     vl_logic
    );
end T1reg16;
