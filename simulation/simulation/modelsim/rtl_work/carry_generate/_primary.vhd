library verilog;
use verilog.vl_types.all;
entity carry_generate is
    port(
        in1             : in     vl_logic_vector(15 downto 0);
        in2             : in     vl_logic_vector(15 downto 0);
        carry           : inout  vl_logic;
        op_code         : in     vl_logic
    );
end carry_generate;
