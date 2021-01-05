set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports clk]; #SW1
set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33} [get_ports reset]; #SW2
set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33} [get_ports TA]; #SW3
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports TB]; #SW4

set_property -dict {PACKAGE_PIN F15 IOSTANDARD LVCMOS33} [get_ports SA[1]]; # LD1
set_property -dict {PACKAGE_PIN F13 IOSTANDARD LVCMOS33} [get_ports SA[0]]; # LD2
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports SB[1]]; # LD3
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33} [get_ports SB[0]]; # LD4

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {clk_IBUF}];
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {reset_IBUF}];
