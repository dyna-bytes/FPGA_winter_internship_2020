set_property -dict {PACKAGE_PIN R4 IOSTANDARD LVCMOS33} [get_ports clk]
set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports reset]

set_property -dict {PACKAGE_PIN D21 IOSTANDARD LVCMOS33} [get_ports start]
set_property -dict {PACKAGE_PIN G21 IOSTANDARD LVCMOS33} [get_ports stop]


set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS33} [get_ports seg[0]]
set_property -dict {PACKAGE_PIN C20 IOSTANDARD LVCMOS33} [get_ports seg[1]]
set_property -dict {PACKAGE_PIN C22 IOSTANDARD LVCMOS33} [get_ports seg[2]]
set_property -dict {PACKAGE_PIN B22 IOSTANDARD LVCMOS33} [get_ports seg[3]]
set_property -dict {PACKAGE_PIN B21 IOSTANDARD LVCMOS33} [get_ports seg[4]]
set_property -dict {PACKAGE_PIN A21 IOSTANDARD LVCMOS33} [get_ports seg[5]]
set_property -dict {PACKAGE_PIN E22 IOSTANDARD LVCMOS33} [get_ports seg[6]]
set_property -dict {PACKAGE_PIN D22 IOSTANDARD LVCMOS33} [get_ports seg[7]]

set_property -dict {PACKAGE_PIN AB12 IOSTANDARD LVCMOS33} [get_ports seg_sel[5]]
set_property -dict {PACKAGE_PIN AB11 IOSTANDARD LVCMOS33} [get_ports seg_sel[4]]
set_property -dict {PACKAGE_PIN D14 IOSTANDARD LVCMOS33} [get_ports seg_sel[3]]
set_property -dict {PACKAGE_PIN D16 IOSTANDARD LVCMOS33} [get_ports seg_sel[2]]
set_property -dict {PACKAGE_PIN E16 IOSTANDARD LVCMOS33} [get_ports seg_sel[1]]
set_property -dict {PACKAGE_PIN E14 IOSTANDARD LVCMOS33} [get_ports seg_sel[0]]