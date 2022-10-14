-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.1
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity matrixmul is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    a_dout : IN STD_LOGIC_VECTOR (23 downto 0);
    a_empty_n : IN STD_LOGIC;
    a_read : OUT STD_LOGIC;
    b_dout : IN STD_LOGIC_VECTOR (23 downto 0);
    b_empty_n : IN STD_LOGIC;
    b_read : OUT STD_LOGIC;
    res_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    res_full_n : IN STD_LOGIC;
    res_write : OUT STD_LOGIC );
end;


architecture behav of matrixmul is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "matrixmul,hls_ip_2020_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcvu9p-flgb2104-1-e,HLS_INPUT_CLOCK=13.333000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.741750,HLS_SYN_LAT=9,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=2,HLS_SYN_FF=124,HLS_SYN_LUT=461,HLS_VERSION=2020_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv4_8 : STD_LOGIC_VECTOR (3 downto 0) := "1000";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal icmp_ln63_fu_538_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal icmp_ln70_fu_241_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln75_fu_292_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state2_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal a_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal b_blk_n : STD_LOGIC;
    signal res_blk_n : STD_LOGIC;
    signal i18_reg_155 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln6517_reg_169 : STD_LOGIC_VECTOR (0 downto 0);
    signal j_016_reg_183 : STD_LOGIC_VECTOR (1 downto 0);
    signal i_03_reg_197 : STD_LOGIC_VECTOR (1 downto 0);
    signal indvar_flatten2_reg_211 : STD_LOGIC_VECTOR (3 downto 0);
    signal select_ln65_fu_225_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln65_reg_743 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln63_fu_233_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln63_reg_750 : STD_LOGIC_VECTOR (1 downto 0);
    signal add_ln63_fu_247_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal add_ln63_reg_758 : STD_LOGIC_VECTOR (3 downto 0);
    signal j_fu_520_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal j_reg_766 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln65_fu_526_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln65_reg_771 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fu_532_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal i_reg_776 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln63_reg_781 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_phi_mux_i18_phi_fu_159_p6 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_phi_mux_icmp_ln6517_phi_fu_173_p6 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_j_016_phi_fu_187_p6 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_phi_mux_i_03_phi_fu_201_p6 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_phi_mux_indvar_flatten2_phi_fu_215_p6 : STD_LOGIC_VECTOR (3 downto 0);
    signal b_copy_2_2_1_fu_72 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_2_2_5_fu_363_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_2_2_2_fu_76 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_2_2_7_fu_379_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_2_2_3_fu_80 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_2_2_9_fu_387_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_1_2_1_fu_84 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_1_2_5_fu_403_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_1_2_2_fu_88 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_1_2_7_fu_419_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_1_2_3_fu_92 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_1_2_9_fu_427_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_0_2_1_fu_96 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_0_2_5_fu_443_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_0_2_2_fu_100 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_0_2_7_fu_459_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_0_2_3_fu_104 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_0_2_9_fu_467_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal a_row_2_1_fu_108 : STD_LOGIC_VECTOR (7 downto 0);
    signal a_row_1_1_fu_112 : STD_LOGIC_VECTOR (7 downto 0);
    signal a_row_0_fu_116 : STD_LOGIC_VECTOR (7 downto 0);
    signal a_row_0_1_fu_253_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_645_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal icmp_ln77_fu_349_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal b_copy_2_2_10_fu_339_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_2_2_fu_355_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_2_2_6_fu_371_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_1_2_10_fu_329_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_1_2_fu_395_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_1_2_6_fu_411_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_0_2_10_fu_325_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_0_2_fu_435_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_0_2_6_fu_451_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_1_fu_584_p5 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_2_fu_603_p5 : STD_LOGIC_VECTOR (7 downto 0);
    signal mul_ln82_1_fu_618_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal mul_ln82_1_fu_618_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_4_fu_628_p5 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_653_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_653_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_condition_78 : BOOLEAN;

    component matrixmul_mux_32_bkb IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        din3_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        din2 : IN STD_LOGIC_VECTOR (7 downto 0);
        din3 : IN STD_LOGIC_VECTOR (1 downto 0);
        dout : OUT STD_LOGIC_VECTOR (7 downto 0) );
    end component;


    component matrixmul_mac_mulcud IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        din2 : IN STD_LOGIC_VECTOR (15 downto 0);
        dout : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component matrixmul_mac_muldEe IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        din2 : IN STD_LOGIC_VECTOR (15 downto 0);
        dout : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;



begin
    matrixmul_mux_32_bkb_U1 : component matrixmul_mux_32_bkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        din2_WIDTH => 8,
        din3_WIDTH => 2,
        dout_WIDTH => 8)
    port map (
        din0 => b_copy_0_2_3_fu_104,
        din1 => b_copy_0_2_2_fu_100,
        din2 => b_copy_0_2_1_fu_96,
        din3 => select_ln65_reg_743,
        dout => tmp_1_fu_584_p5);

    matrixmul_mux_32_bkb_U2 : component matrixmul_mux_32_bkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        din2_WIDTH => 8,
        din3_WIDTH => 2,
        dout_WIDTH => 8)
    port map (
        din0 => b_copy_1_2_3_fu_92,
        din1 => b_copy_1_2_2_fu_88,
        din2 => b_copy_1_2_1_fu_84,
        din3 => select_ln65_reg_743,
        dout => tmp_2_fu_603_p5);

    matrixmul_mux_32_bkb_U3 : component matrixmul_mux_32_bkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        din2_WIDTH => 8,
        din3_WIDTH => 2,
        dout_WIDTH => 8)
    port map (
        din0 => b_copy_2_2_3_fu_80,
        din1 => b_copy_2_2_2_fu_76,
        din2 => b_copy_2_2_1_fu_72,
        din3 => select_ln65_reg_743,
        dout => tmp_4_fu_628_p5);

    matrixmul_mac_mulcud_U4 : component matrixmul_mac_mulcud
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        din2_WIDTH => 16,
        dout_WIDTH => 16)
    port map (
        din0 => a_row_0_fu_116,
        din1 => tmp_1_fu_584_p5,
        din2 => grp_fu_653_p3,
        dout => grp_fu_645_p3);

    matrixmul_mac_muldEe_U5 : component matrixmul_mac_muldEe
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        din2_WIDTH => 16,
        dout_WIDTH => 16)
    port map (
        din0 => a_row_2_1_fu_108,
        din1 => tmp_4_fu_628_p5,
        din2 => grp_fu_653_p2,
        dout => grp_fu_653_p3);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start;
                elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i18_reg_155_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln63_reg_781 = ap_const_lv1_0))) then 
                i18_reg_155 <= i_reg_776;
            elsif ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln63_reg_781 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
                i18_reg_155 <= ap_const_lv2_1;
            end if; 
        end if;
    end process;

    i_03_reg_197_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln63_reg_781 = ap_const_lv1_0))) then 
                i_03_reg_197 <= select_ln63_reg_750;
            elsif ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln63_reg_781 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
                i_03_reg_197 <= ap_const_lv2_0;
            end if; 
        end if;
    end process;

    icmp_ln6517_reg_169_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln63_reg_781 = ap_const_lv1_0))) then 
                icmp_ln6517_reg_169 <= icmp_ln65_reg_771;
            elsif ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln63_reg_781 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
                icmp_ln6517_reg_169 <= ap_const_lv1_0;
            end if; 
        end if;
    end process;

    indvar_flatten2_reg_211_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln63_reg_781 = ap_const_lv1_0))) then 
                indvar_flatten2_reg_211 <= add_ln63_reg_758;
            elsif ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln63_reg_781 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
                indvar_flatten2_reg_211 <= ap_const_lv4_0;
            end if; 
        end if;
    end process;

    j_016_reg_183_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln63_reg_781 = ap_const_lv1_0))) then 
                j_016_reg_183 <= j_reg_766;
            elsif ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln63_reg_781 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
                j_016_reg_183 <= ap_const_lv2_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln70_fu_241_p2 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                a_row_0_fu_116 <= a_row_0_1_fu_253_p1;
                a_row_1_1_fu_112 <= a_dout(15 downto 8);
                a_row_2_1_fu_108 <= a_dout(23 downto 16);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                add_ln63_reg_758 <= add_ln63_fu_247_p2;
                i_reg_776 <= i_fu_532_p2;
                icmp_ln65_reg_771 <= icmp_ln65_fu_526_p2;
                j_reg_766 <= j_fu_520_p2;
                select_ln63_reg_750 <= select_ln63_fu_233_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln75_fu_292_p2 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                b_copy_0_2_1_fu_96 <= b_copy_0_2_5_fu_443_p3;
                b_copy_0_2_2_fu_100 <= b_copy_0_2_7_fu_459_p3;
                b_copy_0_2_3_fu_104 <= b_copy_0_2_9_fu_467_p3;
                b_copy_1_2_1_fu_84 <= b_copy_1_2_5_fu_403_p3;
                b_copy_1_2_2_fu_88 <= b_copy_1_2_7_fu_419_p3;
                b_copy_1_2_3_fu_92 <= b_copy_1_2_9_fu_427_p3;
                b_copy_2_2_1_fu_72 <= b_copy_2_2_5_fu_363_p3;
                b_copy_2_2_2_fu_76 <= b_copy_2_2_7_fu_379_p3;
                b_copy_2_2_3_fu_80 <= b_copy_2_2_9_fu_387_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln63_reg_781 <= icmp_ln63_fu_538_p2;
                select_ln65_reg_743 <= select_ln65_fu_225_p3;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_block_pp0_stage0_subdone, ap_reset_idle_pp0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((ap_reset_idle_pp0 = ap_const_logic_0)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif (((ap_reset_idle_pp0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;

    a_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, a_empty_n, icmp_ln70_fu_241_p2, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (icmp_ln70_fu_241_p2 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            a_blk_n <= a_empty_n;
        else 
            a_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    a_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, icmp_ln70_fu_241_p2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln70_fu_241_p2 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            a_read <= ap_const_logic_1;
        else 
            a_read <= ap_const_logic_0;
        end if; 
    end process;

    a_row_0_1_fu_253_p1 <= a_dout(8 - 1 downto 0);
    add_ln63_fu_247_p2 <= std_logic_vector(unsigned(ap_phi_mux_indvar_flatten2_phi_fu_215_p6) + unsigned(ap_const_lv4_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(1);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, a_empty_n, icmp_ln70_fu_241_p2, b_empty_n, icmp_ln75_fu_292_p2, res_full_n, ap_enable_reg_pp0_iter1)
    begin
                ap_block_pp0_stage0_01001 <= (((res_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and (((b_empty_n = ap_const_logic_0) and (icmp_ln75_fu_292_p2 = ap_const_lv1_1)) or ((ap_const_logic_0 = a_empty_n) and (icmp_ln70_fu_241_p2 = ap_const_lv1_1)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, a_empty_n, icmp_ln70_fu_241_p2, b_empty_n, icmp_ln75_fu_292_p2, res_full_n, ap_enable_reg_pp0_iter1)
    begin
                ap_block_pp0_stage0_11001 <= (((res_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and (((b_empty_n = ap_const_logic_0) and (icmp_ln75_fu_292_p2 = ap_const_lv1_1)) or ((ap_const_logic_0 = a_empty_n) and (icmp_ln70_fu_241_p2 = ap_const_lv1_1)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, a_empty_n, icmp_ln70_fu_241_p2, b_empty_n, icmp_ln75_fu_292_p2, res_full_n, ap_enable_reg_pp0_iter1)
    begin
                ap_block_pp0_stage0_subdone <= (((res_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and (((b_empty_n = ap_const_logic_0) and (icmp_ln75_fu_292_p2 = ap_const_lv1_1)) or ((ap_const_logic_0 = a_empty_n) and (icmp_ln70_fu_241_p2 = ap_const_lv1_1)))));
    end process;


    ap_block_state2_pp0_stage0_iter0_assign_proc : process(a_empty_n, icmp_ln70_fu_241_p2, b_empty_n, icmp_ln75_fu_292_p2)
    begin
                ap_block_state2_pp0_stage0_iter0 <= (((b_empty_n = ap_const_logic_0) and (icmp_ln75_fu_292_p2 = ap_const_lv1_1)) or ((ap_const_logic_0 = a_empty_n) and (icmp_ln70_fu_241_p2 = ap_const_lv1_1)));
    end process;


    ap_block_state3_pp0_stage0_iter1_assign_proc : process(res_full_n)
    begin
                ap_block_state3_pp0_stage0_iter1 <= (res_full_n = ap_const_logic_0);
    end process;


    ap_condition_78_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
                ap_condition_78 <= ((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001, icmp_ln63_reg_781)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln63_reg_781 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start;

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to0_assign_proc : process(ap_enable_reg_pp0_iter0)
    begin
        if ((ap_enable_reg_pp0_iter0 = ap_const_logic_0)) then 
            ap_idle_pp0_0to0 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_i18_phi_fu_159_p6_assign_proc : process(i18_reg_155, i_reg_776, icmp_ln63_reg_781, ap_condition_78)
    begin
        if ((ap_const_boolean_1 = ap_condition_78)) then
            if ((icmp_ln63_reg_781 = ap_const_lv1_1)) then 
                ap_phi_mux_i18_phi_fu_159_p6 <= ap_const_lv2_1;
            elsif ((icmp_ln63_reg_781 = ap_const_lv1_0)) then 
                ap_phi_mux_i18_phi_fu_159_p6 <= i_reg_776;
            else 
                ap_phi_mux_i18_phi_fu_159_p6 <= i18_reg_155;
            end if;
        else 
            ap_phi_mux_i18_phi_fu_159_p6 <= i18_reg_155;
        end if; 
    end process;


    ap_phi_mux_i_03_phi_fu_201_p6_assign_proc : process(i_03_reg_197, select_ln63_reg_750, icmp_ln63_reg_781, ap_condition_78)
    begin
        if ((ap_const_boolean_1 = ap_condition_78)) then
            if ((icmp_ln63_reg_781 = ap_const_lv1_1)) then 
                ap_phi_mux_i_03_phi_fu_201_p6 <= ap_const_lv2_0;
            elsif ((icmp_ln63_reg_781 = ap_const_lv1_0)) then 
                ap_phi_mux_i_03_phi_fu_201_p6 <= select_ln63_reg_750;
            else 
                ap_phi_mux_i_03_phi_fu_201_p6 <= i_03_reg_197;
            end if;
        else 
            ap_phi_mux_i_03_phi_fu_201_p6 <= i_03_reg_197;
        end if; 
    end process;


    ap_phi_mux_icmp_ln6517_phi_fu_173_p6_assign_proc : process(icmp_ln6517_reg_169, icmp_ln65_reg_771, icmp_ln63_reg_781, ap_condition_78)
    begin
        if ((ap_const_boolean_1 = ap_condition_78)) then
            if ((icmp_ln63_reg_781 = ap_const_lv1_1)) then 
                ap_phi_mux_icmp_ln6517_phi_fu_173_p6 <= ap_const_lv1_0;
            elsif ((icmp_ln63_reg_781 = ap_const_lv1_0)) then 
                ap_phi_mux_icmp_ln6517_phi_fu_173_p6 <= icmp_ln65_reg_771;
            else 
                ap_phi_mux_icmp_ln6517_phi_fu_173_p6 <= icmp_ln6517_reg_169;
            end if;
        else 
            ap_phi_mux_icmp_ln6517_phi_fu_173_p6 <= icmp_ln6517_reg_169;
        end if; 
    end process;


    ap_phi_mux_indvar_flatten2_phi_fu_215_p6_assign_proc : process(indvar_flatten2_reg_211, add_ln63_reg_758, icmp_ln63_reg_781, ap_condition_78)
    begin
        if ((ap_const_boolean_1 = ap_condition_78)) then
            if ((icmp_ln63_reg_781 = ap_const_lv1_1)) then 
                ap_phi_mux_indvar_flatten2_phi_fu_215_p6 <= ap_const_lv4_0;
            elsif ((icmp_ln63_reg_781 = ap_const_lv1_0)) then 
                ap_phi_mux_indvar_flatten2_phi_fu_215_p6 <= add_ln63_reg_758;
            else 
                ap_phi_mux_indvar_flatten2_phi_fu_215_p6 <= indvar_flatten2_reg_211;
            end if;
        else 
            ap_phi_mux_indvar_flatten2_phi_fu_215_p6 <= indvar_flatten2_reg_211;
        end if; 
    end process;


    ap_phi_mux_j_016_phi_fu_187_p6_assign_proc : process(j_016_reg_183, j_reg_766, icmp_ln63_reg_781, ap_condition_78)
    begin
        if ((ap_const_boolean_1 = ap_condition_78)) then
            if ((icmp_ln63_reg_781 = ap_const_lv1_1)) then 
                ap_phi_mux_j_016_phi_fu_187_p6 <= ap_const_lv2_0;
            elsif ((icmp_ln63_reg_781 = ap_const_lv1_0)) then 
                ap_phi_mux_j_016_phi_fu_187_p6 <= j_reg_766;
            else 
                ap_phi_mux_j_016_phi_fu_187_p6 <= j_016_reg_183;
            end if;
        else 
            ap_phi_mux_j_016_phi_fu_187_p6 <= j_016_reg_183;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_start, icmp_ln63_fu_538_p2, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln63_fu_538_p2 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to0)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to0 = ap_const_logic_1))) then 
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else 
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    b_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, b_empty_n, icmp_ln75_fu_292_p2, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (icmp_ln75_fu_292_p2 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            b_blk_n <= b_empty_n;
        else 
            b_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    b_copy_0_2_10_fu_325_p1 <= b_dout(8 - 1 downto 0);
    b_copy_0_2_5_fu_443_p3 <= 
        b_copy_0_2_1_fu_96 when (icmp_ln70_fu_241_p2(0) = '1') else 
        b_copy_0_2_fu_435_p3;
    b_copy_0_2_6_fu_451_p3 <= 
        b_copy_0_2_10_fu_325_p1 when (icmp_ln77_fu_349_p2(0) = '1') else 
        b_copy_0_2_2_fu_100;
    b_copy_0_2_7_fu_459_p3 <= 
        b_copy_0_2_2_fu_100 when (icmp_ln70_fu_241_p2(0) = '1') else 
        b_copy_0_2_6_fu_451_p3;
    b_copy_0_2_9_fu_467_p3 <= 
        b_copy_0_2_10_fu_325_p1 when (icmp_ln70_fu_241_p2(0) = '1') else 
        b_copy_0_2_3_fu_104;
    b_copy_0_2_fu_435_p3 <= 
        b_copy_0_2_1_fu_96 when (icmp_ln77_fu_349_p2(0) = '1') else 
        b_copy_0_2_10_fu_325_p1;
    b_copy_1_2_10_fu_329_p4 <= b_dout(15 downto 8);
    b_copy_1_2_5_fu_403_p3 <= 
        b_copy_1_2_1_fu_84 when (icmp_ln70_fu_241_p2(0) = '1') else 
        b_copy_1_2_fu_395_p3;
    b_copy_1_2_6_fu_411_p3 <= 
        b_copy_1_2_10_fu_329_p4 when (icmp_ln77_fu_349_p2(0) = '1') else 
        b_copy_1_2_2_fu_88;
    b_copy_1_2_7_fu_419_p3 <= 
        b_copy_1_2_2_fu_88 when (icmp_ln70_fu_241_p2(0) = '1') else 
        b_copy_1_2_6_fu_411_p3;
    b_copy_1_2_9_fu_427_p3 <= 
        b_copy_1_2_10_fu_329_p4 when (icmp_ln70_fu_241_p2(0) = '1') else 
        b_copy_1_2_3_fu_92;
    b_copy_1_2_fu_395_p3 <= 
        b_copy_1_2_1_fu_84 when (icmp_ln77_fu_349_p2(0) = '1') else 
        b_copy_1_2_10_fu_329_p4;
    b_copy_2_2_10_fu_339_p4 <= b_dout(23 downto 16);
    b_copy_2_2_5_fu_363_p3 <= 
        b_copy_2_2_1_fu_72 when (icmp_ln70_fu_241_p2(0) = '1') else 
        b_copy_2_2_fu_355_p3;
    b_copy_2_2_6_fu_371_p3 <= 
        b_copy_2_2_10_fu_339_p4 when (icmp_ln77_fu_349_p2(0) = '1') else 
        b_copy_2_2_2_fu_76;
    b_copy_2_2_7_fu_379_p3 <= 
        b_copy_2_2_2_fu_76 when (icmp_ln70_fu_241_p2(0) = '1') else 
        b_copy_2_2_6_fu_371_p3;
    b_copy_2_2_9_fu_387_p3 <= 
        b_copy_2_2_10_fu_339_p4 when (icmp_ln70_fu_241_p2(0) = '1') else 
        b_copy_2_2_3_fu_80;
    b_copy_2_2_fu_355_p3 <= 
        b_copy_2_2_1_fu_72 when (icmp_ln77_fu_349_p2(0) = '1') else 
        b_copy_2_2_10_fu_339_p4;

    b_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, icmp_ln75_fu_292_p2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln75_fu_292_p2 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            b_read <= ap_const_logic_1;
        else 
            b_read <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_653_p2 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(std_logic_vector(signed(mul_ln82_1_fu_618_p0) * signed(mul_ln82_1_fu_618_p1))), 16));
    i_fu_532_p2 <= std_logic_vector(unsigned(select_ln63_fu_233_p3) + unsigned(ap_const_lv2_1));
    icmp_ln63_fu_538_p2 <= "1" when (ap_phi_mux_indvar_flatten2_phi_fu_215_p6 = ap_const_lv4_8) else "0";
    icmp_ln65_fu_526_p2 <= "1" when (j_fu_520_p2 = ap_const_lv2_3) else "0";
    icmp_ln70_fu_241_p2 <= "1" when (select_ln65_fu_225_p3 = ap_const_lv2_0) else "0";
    icmp_ln75_fu_292_p2 <= "1" when (select_ln63_fu_233_p3 = ap_const_lv2_0) else "0";
    icmp_ln77_fu_349_p2 <= "1" when (select_ln65_fu_225_p3 = ap_const_lv2_1) else "0";
    j_fu_520_p2 <= std_logic_vector(unsigned(select_ln65_fu_225_p3) + unsigned(ap_const_lv2_1));
    mul_ln82_1_fu_618_p0 <= a_row_1_1_fu_112;
    mul_ln82_1_fu_618_p1 <= tmp_2_fu_603_p5;

    res_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, res_full_n, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            res_blk_n <= res_full_n;
        else 
            res_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    res_din <= grp_fu_645_p3;

    res_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            res_write <= ap_const_logic_1;
        else 
            res_write <= ap_const_logic_0;
        end if; 
    end process;

    select_ln63_fu_233_p3 <= 
        ap_phi_mux_i18_phi_fu_159_p6 when (ap_phi_mux_icmp_ln6517_phi_fu_173_p6(0) = '1') else 
        ap_phi_mux_i_03_phi_fu_201_p6;
    select_ln65_fu_225_p3 <= 
        ap_const_lv2_0 when (ap_phi_mux_icmp_ln6517_phi_fu_173_p6(0) = '1') else 
        ap_phi_mux_j_016_phi_fu_187_p6;
end behav;
