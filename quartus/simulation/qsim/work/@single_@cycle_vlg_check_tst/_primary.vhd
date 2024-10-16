library verilog;
use verilog.vl_types.all;
entity Single_Cycle_vlg_check_tst is
    port(
        alu_data_out    : in     vl_logic_vector(31 downto 0);
        branch_signal   : in     vl_logic;
        instruc_test    : in     vl_logic_vector(31 downto 0);
        io_hex0         : in     vl_logic_vector(6 downto 0);
        io_hex1         : in     vl_logic_vector(6 downto 0);
        io_hex2         : in     vl_logic_vector(6 downto 0);
        io_hex3         : in     vl_logic_vector(6 downto 0);
        io_hex4         : in     vl_logic_vector(6 downto 0);
        io_hex5         : in     vl_logic_vector(6 downto 0);
        io_hex6         : in     vl_logic_vector(6 downto 0);
        io_hex7         : in     vl_logic_vector(6 downto 0);
        io_lcd          : in     vl_logic_vector(7 downto 0);
        io_ledg         : in     vl_logic_vector(8 downto 0);
        io_ledr         : in     vl_logic_vector(17 downto 0);
        pc_debug        : in     vl_logic_vector(31 downto 0);
        rs1             : in     vl_logic_vector(4 downto 0);
        rs2             : in     vl_logic_vector(4 downto 0);
        wb_mux_out      : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Single_Cycle_vlg_check_tst;
