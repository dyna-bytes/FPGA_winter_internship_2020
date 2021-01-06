set_property -dict {PACKAGE_PIN R4 IOSTANDARD LVCMOS33} [get_ports fpga_clk];
set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports reset];

set_property -dict {PACKAGE_PIN F15 IOSTANDARD LVCMOS33} [get_ports o_clk];

set_property CONFIG_MODE SPIx4 [current_design];
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design];