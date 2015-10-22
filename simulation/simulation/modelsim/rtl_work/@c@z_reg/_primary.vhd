library verilog;
use verilog.vl_types.all;
entity CZ_reg is
    port(
        IR_CZ           : in     vl_logic_vector(1 downto 0);
        inC             : in     vl_logic;
        inZ             : in     vl_logic;
        en              : in     vl_logic;
        \out\           : out    vl_logic
    );
end CZ_reg;
