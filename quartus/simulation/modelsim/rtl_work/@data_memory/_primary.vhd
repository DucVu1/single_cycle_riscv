library verilog;
use verilog.vl_types.all;
entity Data_memory is
    generic(
        WORDS           : integer := 8192;
        WIDTH           : integer := 32
    );
    port(
        st_en           : in     vl_logic;
        clk_i           : in     vl_logic;
        addr            : in     vl_logic_vector;
        funct3          : in     vl_logic_vector(2 downto 0);
        st_data         : in     vl_logic_vector;
        ld_data         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WORDS : constant is 1;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end Data_memory;
