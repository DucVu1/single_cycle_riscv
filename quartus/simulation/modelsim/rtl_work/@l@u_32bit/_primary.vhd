library verilog;
use verilog.vl_types.all;
entity LU_32bit is
    generic(
        N               : integer := 32
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        Operation       : in     vl_logic_vector(1 downto 0);
        Result          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end LU_32bit;
