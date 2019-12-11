library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity AND_gate is
port(
input1 : in std_logic;
input2 : in std_logic;
output : out std_logic
);
end AND_gate;

architecture behavioral of AND_gate is
begin
process(input1,input2)
begin
output<= input1 AND input2;
end process;
end behavioral;
-----------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FULL_ADDER is
port(
FA_in1:in std_logic;
FA_in2:in std_logic;
FA_carryin:in std_logic;
FA_carryout:out std_logic;
FA_sum:out std_logic
);
end FULL_ADDER;
architecture behavioral of FULL_ADDER is
begin
process (FA_in1,FA_in2)
begin 
FA_sum <= FA_in1 XOR FA_in2 XOR FA_carryin;
FA_carryout <= (FA_in1 AND FA_in2) OR (FA_carryin AND FA_in1) or(FA_carryin AND FA_in2);
end process;
end behavioral;
-----------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity fourbitadder is 
port(
Y0:in std_logic;
Y1:in std_logic;
Y2:in std_logic;
Y3:in std_logic;
X0:in std_logic;
X1:in std_logic;
X2:in std_logic;
X3:in std_logic;
H_in:in std_logic :='0';
Z0:out std_logic;
Z1:out std_logic;
Z2:out std_logic;
Z3:out std_logic;
Z4:out std_logic
);
end fourbitadder;
architecture Behavioral of fourbitadder is
component FULL_ADDER is
port(
FA_in1:in std_logic;
FA_in2:in std_logic;
FA_carryin:in std_logic;
FA_carryout:out std_logic;
FA_sum:out std_logic
);
end component;
signal T0:STD_LOGIC;
signal T1:STD_LOGIC;
signal T2:STD_LOGIC;
begin 
block1:FULL_ADDER port map (FA_in1=>Y0,FA_in2=>X0,FA_carryin=>H_in,FA_carryout=>T0,FA_sum=>Z0);
block2:FULL_ADDER port map (FA_in1=>Y1,FA_in2=>X1,FA_carryin=>T0,FA_carryout=>T1,FA_sum=>Z1);
block3:FULL_ADDER port map (FA_in1=>Y2,FA_in2=>X2,FA_carryin=>T1,FA_carryout=>T2,FA_sum=>Z2);
block4:FULL_ADDER port map (FA_in1=>Y3,FA_in2=>X3,FA_carryin=>T2,FA_carryout=>Z4,FA_sum=>Z3);
end behavioral;

-----------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity devre4 is
port (
A0:in std_logic;
A1:in std_logic;
A2:in std_logic;
H0:in std_logic;
H1:in std_logic;
H2:in std_logic;
H3:in std_logic;
H_in:in std_logic :='0';
C0:out std_logic;
C1:out std_logic;
C2:out std_logic;
C3:out std_logic;
C4:out std_logic;
C5:out std_logic;
C6:out std_logic
);
end devre4;
architecture Behavioral of devre4 is
component fourbitadder is
port(
Y0:in std_logic;
Y1:in std_logic;
Y2:in std_logic;
Y3:in std_logic;
X0:in std_logic;
X1:in std_logic;
X2:in std_logic;
X3:in std_logic;
H_in:in std_logic :='0';
Z0:out std_logic;
Z1:out std_logic;
Z2:out std_logic;
Z3:out std_logic;
Z4:out std_logic
);
end component;
component AND_gate is
port(
input1 : in std_logic;
input2 : in std_logic;
output : out std_logic
);
end component;
signal l1 :STD_LOGIC;
signal l2 :STD_LOGIC;
signal l3 :STD_LOGIC;
signal l4 :STD_LOGIC;
signal l5 :STD_LOGIC;
signal l6 :STD_LOGIC;
signal l7 :STD_LOGIC;
signal l8 :STD_LOGIC;
signal l9 :STD_LOGIC;
signal l10 :STD_LOGIC;
signal l11 :STD_LOGIC;
signal l12 :STD_LOGIC;
signal l13 :STD_LOGIC;
signal l14 :STD_LOGIC;
signal l15 :STD_LOGIC;
signal l16 :STD_LOGIC;
signal l17 :STD_LOGIC;
signal l18 :STD_LOGIC;
signal l19 :STD_LOGIC;
signal l20 :STD_LOGIC;
begin
block1: AND_gate port map(input1=>H0,input2=>A0,output=>C0);
block2: AND_gate port map(input1=>H1,input2=>A0,output=>l1);
block3: AND_gate port map(input1=>H2,input2=>A0,output=>l2);
block4: AND_gate port map(input1=>H3,input2=>A0,output=>l3);
block5: AND_gate port map(input1=>H0,input2=>A1,output=>l4);
block6: AND_gate port map(input1=>H1,input2=>A1,output=>l5);
block7: AND_gate port map(input1=>H2,input2=>A1,output=>l6);
block8: AND_gate port map(input1=>H3,input2=>A1,output=>l7);
block9: fourbitadder port map(Y0=>l1,Y1=>l2,Y2=>l3,Y3=>H_in,X0=>l4,X1=>l5,X2=>l6,X3=>l7,Z0=>C1,Z1=>l8,Z2=>l9,Z3=>l10,Z4=>l11);
block10: AND_gate port map(input1=>H0,input2=>A2,output=>l12);
block11: AND_gate port map(input1=>H1,input2=>A2,output=>l13);
block12: AND_gate port map(input1=>H2,input2=>A2,output=>l14);
block13:AND_gate port map(input1=>H3,input2=>A2,output=>l15);
block14: fourbitadder port map(Y0=>l8,Y1=>l9,Y2=>l10,Y3=>l11,X0=>l12,X1=>l13,X2=>l14,X3=>l15,Z0=>C2,Z1=>C3,Z2=>C4,Z3=>C5,Z4=>C6);
end Behavioral;
