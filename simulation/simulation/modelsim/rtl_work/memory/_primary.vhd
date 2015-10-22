library verilog;
use verilog.vl_types.all;
entity memory is
    port(
        address         : in     vl_logic_vector(4 downto 0);
        \in\            : in     vl_logic_vector(15 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0);
        write           : in     vl_logic;
        read            : in     vl_logic;
        clk             : in     vl_logic;
        proc_rst        : in     vl_logic
    );
end memory;
