library verilog;
use verilog.vl_types.all;
entity SMcomparator is
    generic(
        N               : integer := 32
    );
    port(
        Cout            : in     vl_logic;
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        less_than       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end SMcomparator;
