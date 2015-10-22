library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        in1             : in     vl_logic_vector(15 downto 0);
        in2             : in     vl_logic_vector(15 downto 0);
        ALU_op          : in     vl_logic;
        compare         : out    vl_logic;
        carry           : out    vl_logic;
        \out\           : out    vl_logic_vector(15 downto 0);
        zero            : out    vl_logic
    );
end alu;
