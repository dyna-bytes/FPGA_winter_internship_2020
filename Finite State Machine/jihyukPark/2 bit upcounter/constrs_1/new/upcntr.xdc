set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports reset];  # SW1
set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33} [get_ports clk];    # SW2
set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33} [get_ports trigger];# SW3

set_property -dict {PACKAGE_PIN F15 IOSTANDARD LVCMOS33} [get_ports state[1]]; # LD1
set_property -dict {PACKAGE_PIN F13 IOSTANDARD LVCMOS33} [get_ports state[0]]; # LD2

#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {reset_IBUF_inst}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {clk_IBUF_inst}]
