library verilog;
use verilog.vl_types.all;
entity Output_Periph is
    port(
        clk_i           : in     vl_logic;
        rst_ni          : in     vl_logic;
        st_en           : in     vl_logic;
        funct3          : in     vl_logic_vector(2 downto 0);
        addr            : in     vl_logic_vector(7 downto 0);
        st_data         : in     vl_logic_vector(31 downto 0);
        o_io_hex0       : out    vl_logic_vector(6 downto 0);
        o_io_hex1       : out    vl_logic_vector(6 downto 0);
        o_io_hex2       : out    vl_logic_vector(6 downto 0);
        o_io_hex3       : out    vl_logic_vector(6 downto 0);
        o_io_hex4       : out    vl_logic_vector(6 downto 0);
        o_io_hex5       : out    vl_logic_vector(6 downto 0);
        o_io_hex6       : out    vl_logic_vector(6 downto 0);
        o_io_hex7       : out    vl_logic_vector(6 downto 0);
        o_io_lcd        : out    vl_logic_vector(11 downto 0);
        o_io_ledg       : out    vl_logic_vector(7 downto 0);
        o_io_ledr       : out    vl_logic_vector(16 downto 0);
        ld_data         : out    vl_logic_vector(31 downto 0)
    );
end Output_Periph;
