set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports clk];
set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33} [get_ports reset];

set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33} [get_ports t[1]]; 
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports t[0]];

set_property -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS33} [get_ports sa[1]];
set_property -dict {PACKAGE_PIN C14 IOSTANDARD LVCMOS33} [get_ports sa[0]];
set_property -dict {PACKAGE_PIN C15 IOSTANDARD LVCMOS33} [get_ports sb[1]];
set_property -dict {PACKAGE_PIN E13 IOSTANDARD LVCMOS33} [get_ports sb[0]];

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF];
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets reset_IBUF];
