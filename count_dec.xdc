set_property PACKAGE_PIN Y9 [clock {GCLK}];  # "GCLK"

set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS25} [get_ports {counter_output[7]}]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS25} [get_ports {counter_output[6]}]
set_property -dict {PACKAGE_PIN W22 IOSTANDARD LVCMOS25} [get_ports {counter_output[5]}]
set_property -dict {PACKAGE_PIN V22 IOSTANDARD LVCMOS25} [get_ports {counter_output[4]}]
set_property -dict {PACKAGE_PIN U21 IOSTANDARD LVCMOS25} [get_ports {counter_output[3]}]
set_property -dict {PACKAGE_PIN U22 IOSTANDARD LVCMOS25} [get_ports {counter_output[2]}]
set_property -dict {PACKAGE_PIN T21 IOSTANDARD LVCMOS25} [get_ports {counter_output[1]}]
set_property -dict {PACKAGE_PIN T22 IOSTANDARD LVCMOS25} [get_ports {counter_output[0]}]

set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS25} [get_ports {reset[7]}]
set_property -dict {PACKAGE_PIN F22 IOSTANDARD LVCMOS25} [get_ports {sel[0]}]


