library verilog;
use verilog.vl_types.all;
entity Immediate_generator is
    generic(
        Width           : integer := 32
    );
    port(
        \In\            : in     vl_logic_vector;
        \Out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Width : constant is 1;
end Immediate_generator;
