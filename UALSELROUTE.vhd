// Code your design here
// Structure UALCore.vhd, CMDBuffer.vhd, INSTRMemory.vhd, UALVuffers.vhd, UALSelout.vhd, UALSelroute.vhd
library IEEE;
use IEEE.std_logic_1164.all;
entity MCU_PRJ_2021_TopLevel is
    Port (
        CLK100MHZ : in STD_LOGIC;
        sw : in STD_LOGIC_VECTOR(3 downto 0);
        btn : in STD_LOGIC_VECTOR(3 downto 0);
        led : out STD_LOGIC_VECTOR(3 downto 0);
        led0_r : out STD_LOGIC; led0_g : out STD_LOGIC; led0_b : out STD_LOGIC;
        led1_r : out STD_LOGIC; led1_g : out STD_LOGIC; led1_b : out STD_LOGIC;
        led2_r : out STD_LOGIC; led2_g : out STD_LOGIC; led2_b : out STD_LOGIC;
        led3_r : out STD_LOGIC; led3_g : out STD_LOGIC; led3_b : out STD_LOGIC
    );
end MCU_PRJ_2021_TopLevel;

component UALSELROUTE
Port(
    SEL_ROUTE : in STD_LOGIC_VECTOR (3 downto 0);
    S : in STD_LOGIC_VECTOR (7 downto 0);
    A : in STD_LOGIC_VECTOR (5 downto 0);
    B : in STD_LOGIC_VECTOR (3 downto 0);
    Buf_A_out : in STD_LOGIC_VECTOR (3 downto 0);
    Buf_B_out : in STD_LOGIC_VECTOR (3 downto 0);
    Mem_1_out : in STD_LOGIC_VECTOR (7 downto 0);
    Mem_2_out : in STD_LOGIC_VECTOR (7 downto 0);
    Buf_A_in : out STD_LOGIC_VECTOR (3 downto 0);
    Buf_B_in : out STD_LOGIC_VECTOR (3 downto 0);
    Mem_1_In : out STD_LOGIC_VECTOR (7 downto 0);
    Mem_2_In : out STD_LOGIC_VECTOR (7 downto 0);
    CE_Buf_A : out STD_LOGIC;
    CE_Buf_B : out STD_LOGIC;
    CE_Mem_1 : out STD_LOGIC;
    CE_Mem_2 : out STD_LOGIC
);
end component;

MyUALSELROUTE : UALSELROUTE
Port Map (
	SEL_ROUTE => My_INSTR_out(5 downto 2),
    S => My_S,
    A => SW,
    B => SW,
    Buf_A_out => My_Buf_A_out,
    Buf_B_out => My_Buf_B_out,
    Mem_1_out => My_Mem_1_out,
    Mem_2_out => My_Mem_2_out,
    Buf_A_in => My_Buf_A_in,
    Buf_B_in => My_Buf_B_in,
    Mem_1_In => My_Mem_1_In,
    Mem_2_In => My_Mem_2_In,
    CE_Buf_A => My_CE_Buf_A,
    CE_Buf_B => My_CE_Buf_B,
    CE_Mem_1 => My_CE_Mem_1,
    CE_Mem_2 => My_CE_Mem_2
    );

  //V_Buf_SR_IN_




  begin
  	case SEL_ROUTE is
    	when "0000" =>
          CE_Buf_A <= '1';
          CE_Buf_B <= '0';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '0';

          Buf_A_in <= A;
          Buf_B_in <= (others => '0');
          Mem_1_In <= (others => '0');
          Mem_2_In <= (others => '0');

        when "0001" =>
          CE_Buf_A <= '1';
          CE_Buf_B <= '0';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '0';

		  Buf_A_in <= Mem_1_out(3 downto 0);
          Buf_B_in <= (others => '0');
          Mem_1_In <= (others => '0');
          Mem_2_In <= (others => '0');

        when "0010" =>
          CE_Buf_A <= '1';
          CE_Buf_B <= '0';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '0';

		  Buf_A_in <= Mem_1_out(7 downto 4);
          Buf_B_in <= (others => '0');
          Mem_1_In <= (others => '0');
          Mem_2_In <= (others => '0');

        when "0011" =>
          CE_Buf_A <= '1';
          CE_Buf_B <= '0';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '0';

		  Buf_A_in <= Mem_2_out(3 downto 0);
          Buf_B_in <= (others => '0');
          Mem_1_In <= (others => '0');
          Mem_2_In <= (others => '0');

        when "0100" =>
          CE_Buf_A <= '1';
          CE_Buf_B <= '0';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '0';

		  Buf_A_in <= Mem_2_out(7 downto 4);
          Buf_B_in <= (others => '0');
          Mem_1_In <= (others => '0');
          Mem_2_In <= (others => '0');

        when "0101" =>
          CE_Buf_A <= '1';
          CE_Buf_B <= '0';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '0';

		  Buf_A_in <= S(3 downto 0);
          Buf_B_in <= (others => '0');
          Mem_1_In <= (others => '0');
          Mem_2_In <= (others => '0');

        when "0110" =>
          CE_Buf_A <= '1';
          CE_Buf_B <= '0';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '0';

		  Buf_A_in <= S(7 downto 4);
          Buf_B_in <= (others => '0');
          Mem_1_In <= (others => '0');
          Mem_2_In <= (others => '0');

        when "0111" =>
          CE_Buf_A <= '0';
          CE_Buf_B <= '1';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '0';

		  Buf_A_in <= (others => '0');
          Buf_B_in <= Buf_B_out;
          Mem_1_In <= (others => '0');
          Mem_2_In <= (others => '0');

        when "1000" =>
          CE_Buf_A <= '0';
          CE_Buf_B <= '1';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '0';

		  Buf_A_in <= (others => '0');
          Buf_B_in <= Mem_1_out(3 downto 0);
          Mem_1_In <= (others => '0');
          Mem_2_In <= (others => '0');

        when "1001" =>
          CE_Buf_A <= '0';
          CE_Buf_B <= '1';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '0';

		  Buf_A_in <= (others => '0');
          Buf_B_in <= Mem_1_out(7 downto 4);
          Mem_1_In <= (others => '0');
          Mem_2_In <= (others => '0');

        when "1010" =>
          CE_Buf_A <= '0';
          CE_Buf_B <= '1';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '0';

		  Buf_A_in <= (others => '0');
          Buf_B_in <= Mem_2_out(3 downto 0);
          Mem_1_In <= (others => '0');
          Mem_2_In <= (others => '0');

        when "1011" =>
          CE_Buf_A <= '0';
          CE_Buf_B <= '1';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '0';

		  Buf_A_in <= (others => '0');
          Buf_B_in <= Mem_2_out(7 downto 4);
          Mem_1_In <= (others => '0');
          Mem_2_In <= (others => '0');

        when "1100" =>
          CE_Buf_A <= '0';
          CE_Buf_B <= '1';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '0';

		  Buf_A_in <= (others => '0');
          Buf_B_in <= S(3 downto 0);
          Mem_1_In <= (others => '0');
          Mem_2_In <= (others => '0');

        when "1101" =>
          CE_Buf_A <= '0';
          CE_Buf_B <= '1';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '0';

		  Buf_A_in <= (others => '0');
          Buf_B_in <= S(7 downto 4);
          Mem_1_In <= (others => '0');
          Mem_2_In <= (others => '0');

        when "1110" =>
          CE_Buf_A <= '0';
          CE_Buf_B <= '0';
          CE_Mem_1 <= '1';
          CE_Mem_2 <= '0';

		  Buf_A_in <= (others => '0');
          Buf_B_in <= (others => '0');
          Mem_1_In <= S(7 downto 0);
          Mem_2_In <= (others => '0');

        when "1111" =>
          CE_Buf_A <= '0';
          CE_Buf_B <= '0';
          CE_Mem_1 <= '0';
          CE_Mem_2 <= '1';

		  Buf_A_in <= (others => '0');
          Buf_B_in <= (others => '0');
          Mem_1_In <= (others => '0');
          Mem_2_In <= S(7 downto 0);
	end
