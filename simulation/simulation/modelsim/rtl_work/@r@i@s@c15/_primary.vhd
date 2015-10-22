library verilog;
use verilog.vl_types.all;
entity RISC15 is
    port(
        clk             : in     vl_logic;
        StateID         : out    vl_logic_vector(5 downto 0);
        proc_rst        : in     vl_logic
    );
end RISC15;
