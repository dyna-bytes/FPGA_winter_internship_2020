NET clk50						period = 50MHz;

NET "clk50_in"					LOC = "R4"; #"T9";

NET "digit_out<0>"			LOC = "E14"; #"D14";
NET "digit_out<1>"			LOC = "E16";#"G14";
NET "digit_out<2>"			LOC = "D16";#"F14";
NET "digit_out<3>"			LOC = "D14";#"E13";

NET "seg_out<0>"				LOC = "D22";#"P16";
NET "seg_out<1>"				LOC = "D20";#"N16";
NET "seg_out<2>"				LOC = "C20";#"F13";
NET "seg_out<3>"				LOC = "C22";#"R16";
NET "seg_out<4>"				LOC = "B22";#"P15";
NET "seg_out<5>"				LOC = "B21";#"N15";
NET "seg_out<6>"				LOC = "A21";#"G13";
NET "seg_out<7>"				LOC = "E22";#"E14";

NET "led_out<0>"				LOC = "F15";#"K12";
NET "led_out<1>"				LOC = "F13";#"P14";
NET "led_out<2>"				LOC = "F14";#"L12";
NET "led_out<3>"				LOC = "F16";#"N14";
NET "led_out<4>"				LOC = "E17";#"P13";
NET "led_out<5>"				LOC = "C14";#"N12";
NET "led_out<6>"				LOC = "C15";#"P12";
NET "led_out<7>"				LOC = "E13";#"P11";

NET "pb_in<0>"					LOC = "E21";#"M13";
NET "pb_in<1>"					LOC = "D21";#"M14";
NET "pb_in<2>"					LOC = "G21";#"L13";
NET "pb_in<3>"					LOC = "G22";#"L14";

NET "sw_in<0>"					LOC = "J4";#"F12";
NET "sw_in<1>"					LOC = "L3";#"G12";
NET "sw_in<2>"					LOC = "K3";#"H14";
NET "sw_in<3>"					LOC = "M2";#"H13";
NET "sw_in<4>"					LOC = "K6";#"J14";
NET "sw_in<5>"					LOC = "J6";#"J13";
NET "sw_in<6>"					LOC = "L5";#"K14";
NET "sw_in<7>"					LOC = "L4";#"K13";

#USER DEFINE PIN FOR EXTERNAL

NET "rf_sw_out<0>"			LOC = "C13";#"C9";
NET "rf_sw_out<1>"			LOC = "B13";#"D10";
NET "rf_sw_out<2>"			LOC = "A15";#"A3";
NET "rf_sw_out<3>"			LOC = "A16";#"B4";

NET "rot_count_out<0>"		LOC = "A13";#"E6";
NET "rot_count_out<1>"		LOC = "A14";#"D5";
NET "rot_count_out<2>"		LOC = "B17";#"C5";
NET "rot_count_out<3>"		LOC = "B18";#"D6";
NET "rot_count_out<4>"		LOC = "J14";#"C6";
NET "rot_count_out<5>"		LOC = "H14";#"E7";
NET "rot_count_out<6>"		LOC = "J22";#"C7";
NET "rot_count_out<7>"		LOC = "H22";#"D7";
NET "rot_count_out<8>"		LOC = "J15";#"C8";
NET "rot_count_out<9>"		LOC = "H15";#"D8";

NET "debug_out"				LOC = "H20";#"A4";

NET "rot_clk_out"				LOC = "G20";#"B5";

NET "stp_clk_out"				LOC = "U15";#"A5";

NET "adc_trg_out"				LOC = "V15";#"B6";