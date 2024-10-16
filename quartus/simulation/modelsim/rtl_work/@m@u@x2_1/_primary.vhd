library verilog;
use verilog.vl_types.all;
entity MUX2_1 is
    generic(
        N               : integer := 32
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        Option          : in     vl_logic;
        \Out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end MUX2_1;
