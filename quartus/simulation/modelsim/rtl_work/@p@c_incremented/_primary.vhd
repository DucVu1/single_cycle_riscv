library verilog;
use verilog.vl_types.all;
entity PC_incremented is
    generic(
        N               : integer := 32
    );
    port(
        PC_in           : in     vl_logic_vector;
        PC_out          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end PC_incremented;
