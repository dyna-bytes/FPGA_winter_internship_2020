set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {reset_IBUF}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {clk_IBUF}] 

set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports clk]; # SW1
set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33} [get_ports reset]; # SW2

set_property -dict {PACKAGE_PIN D21 IOSTANDARD LVCMOS33} [get_ports C]
set_property -dict {PACKAGE_PIN G21 IOSTANDARD LVCMOS33} [get_ports F]
set_property -dict {PACKAGE_PIN G22 IOSTANDARD LVCMOS33} [get_ports P]

set_property -dict {PACKAGE_PIN F15 IOSTANDARD LVCMOS33} [get_ports led[0]]
set_property -dict {PACKAGE_PIN F13 IOSTANDARD LVCMOS33} [get_ports led[1]]
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports o[0]]
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33} [get_ports o[1]]

set_property -dict {PACKAGE_PIN W12 IOSTANDARD LVCMOS33} [get_ports state[0]]
set_property -dict {PACKAGE_PIN W11 IOSTANDARD LVCMOS33} [get_ports state[1]]

set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS33} [get_ports seg[0]]
set_property -dict {PACKAGE_PIN C20 IOSTANDARD LVCMOS33} [get_ports seg[1]]
set_property -dict {PACKAGE_PIN C22 IOSTANDARD LVCMOS33} [get_ports seg[2]]
set_property -dict {PACKAGE_PIN B22 IOSTANDARD LVCMOS33} [get_ports seg[3]]
set_property -dict {PACKAGE_PIN B21 IOSTANDARD LVCMOS33} [get_ports seg[4]]
set_property -dict {PACKAGE_PIN A21 IOSTANDARD LVCMOS33} [get_ports seg[5]]
set_property -dict {PACKAGE_PIN E22 IOSTANDARD LVCMOS33} [get_ports seg[6]]
set_property -dict {PACKAGE_PIN D22 IOSTANDARD LVCMOS33} [get_ports seg[7]]

set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design] 