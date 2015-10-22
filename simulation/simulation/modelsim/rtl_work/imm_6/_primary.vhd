library verilog;
use verilog.vl_types.all;
entity imm_6 is
    port(
        \in\            : in     vl_logic_vector(5 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end imm_6;
