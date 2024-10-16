library verilog;
use verilog.vl_types.all;
entity HEX is
    generic(
        QUANTITY        : integer := 8
    );
    port(
        clk_i           : in     vl_logic;
        rst_ni          : in     vl_logic;
        st_en           : in     vl_logic;
        funct3          : in     vl_logic_vector(2 downto 0);
        addr            : in     vl_logic_vector(2 downto 0);
        st_data         : in     vl_logic_vector(31 downto 0);
        o_io_hex0       : out    vl_logic_vector(6 downto 0);
        o_io_hex1       : out    vl_logic_vector(6 downto 0);
        o_io_hex2       : out    vl_logic_vector(6 downto 0);
        o_io_hex3       : out    vl_logic_vector(6 downto 0);
        o_io_hex4       : out    vl_logic_vector(6 downto 0);
        o_io_hex5       : out    vl_logic_vector(6 downto 0);
        o_io_hex6       : out    vl_logic_vector(6 downto 0);
        o_io_hex7       : out    vl_logic_vector(6 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of QUANTITY : constant is 1;
end HEX;
