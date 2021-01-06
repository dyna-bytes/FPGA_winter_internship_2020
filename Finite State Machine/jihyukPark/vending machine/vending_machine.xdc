set_property -dict {PACKAGE_PIN R4 IOSTANDARD LVCMOS33} [get_ports clock]; #fpga_clk
set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports reset]; #fpja_reset

set_property -dict {PACKAGE_PIN D21 IOSTANDARD LVCMOS33} [get_ports C]; # SW_LEFT
set_property -dict {PACKAGE_PIN G21 IOSTANDARD LVCMOS33} [get_ports F]; # SW_MID
set_property -dict {PACKAGE_PIN G22 IOSTANDARD LVCMOS33} [get_ports P]; # SW_RIGHT

set_property -dict {PACKAGE_PIN F15 IOSTANDARD LVCMOS33} [get_ports o[0]]; # LD1, o_coffee
set_property -dict {PACKAGE_PIN F13 IOSTANDARD LVCMOS33} [get_ports o[1]]; # LD2, o_sprite

set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports state[1]]; # LD3
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33} [get_ports state[0]]; # LD4

set_property -dict {PACKAGE_PIN W11 IOSTANDARD LVCMOS33} [get_ports led[0]]; # LD15, led_coffee
set_property -dict {PACKAGE_PIN W12 IOSTANDARD LVCMOS33} [get_ports led[1]]; # LD16, led_sprite

set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS33} [get_ports seg[0]];
set_property -dict {PACKAGE_PIN C20 IOSTANDARD LVCMOS33} [get_ports seg[1]];
set_property -dict {PACKAGE_PIN C22 IOSTANDARD LVCMOS33} [get_ports seg[2]];
set_property -dict {PACKAGE_PIN B22 IOSTANDARD LVCMOS33} [get_ports seg[3]];
set_property -dict {PACKAGE_PIN B21 IOSTANDARD LVCMOS33} [get_ports seg[4]];
set_property -dict {PACKAGE_PIN A21 IOSTANDARD LVCMOS33} [get_ports seg[5]];
set_property -dict {PACKAGE_PIN E22 IOSTANDARD LVCMOS33} [get_ports seg[6]];
set_property -dict {PACKAGE_PIN D22 IOSTANDARD LVCMOS33} [get_ports seg[7]];

set_property -dict {PACKAGE_PIN E14 IOSTANDARD LVCMOS33} [get_ports seg_sel];

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets C_IBUF];
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets F_IBUF];
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets P_IBUF];

set_property CONFIG_MODE SPIx4 [current_design];
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]; 