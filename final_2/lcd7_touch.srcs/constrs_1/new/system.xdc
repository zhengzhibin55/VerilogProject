##LCD Interface J12
##LCD Interface J12
##LCD Interface J12

set_property PACKAGE_PIN D18 [get_ports {lcd_int_tri_i[0]}]
set_property PACKAGE_PIN E17 [get_ports lcd_bl_pwm]
set_property PACKAGE_PIN F16 [get_ports lcd_iic_scl_io]
set_property PACKAGE_PIN F17 [get_ports lcd_iic_sda_io]
set_property PACKAGE_PIN G19 [get_ports vid_hsync]
set_property PACKAGE_PIN G20 [get_ports vid_vsync]
set_property PACKAGE_PIN J18 [get_ports vid_io_out_clk]
set_property PACKAGE_PIN H18 [get_ports vid_active_video]

set_property PACKAGE_PIN H20 [get_ports {vid_data[4]}]
set_property PACKAGE_PIN J20 [get_ports {vid_data[5]}]
set_property PACKAGE_PIN K18 [get_ports {vid_data[2]}]
set_property PACKAGE_PIN K17 [get_ports {vid_data[3]}]
set_property PACKAGE_PIN G17 [get_ports {vid_data[0]}]
set_property PACKAGE_PIN G18 [get_ports {vid_data[1]}]


set_property PACKAGE_PIN J19 [get_ports {vid_data[10]}]         
set_property PACKAGE_PIN K19 [get_ports {vid_data[11]}]
set_property PACKAGE_PIN H15 [get_ports {vid_data[8]}]
set_property PACKAGE_PIN G15 [get_ports {vid_data[9]}]
set_property PACKAGE_PIN K14 [get_ports {vid_data[6]}]
set_property PACKAGE_PIN J14 [get_ports {vid_data[7]}]


set_property PACKAGE_PIN B19 [get_ports {vid_data[16]}]
set_property PACKAGE_PIN A20 [get_ports {vid_data[17]}]
set_property PACKAGE_PIN C20 [get_ports {vid_data[14]}]
set_property PACKAGE_PIN B20 [get_ports {vid_data[15]}]
set_property PACKAGE_PIN D19 [get_ports {vid_data[12]}]
set_property PACKAGE_PIN D20 [get_ports {vid_data[13]}]




set_property IOSTANDARD LVCMOS33 [get_ports {lcd_int_tri_i[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_bl_pwm]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_iic_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_iic_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports vid_hsync]
set_property IOSTANDARD LVCMOS33 [get_ports vid_vsync]
set_property IOSTANDARD LVCMOS33 [get_ports vid_io_out_clk]
set_property IOSTANDARD LVCMOS33 [get_ports vid_active_video]

set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[3]}]


set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[11]}]


set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[17]}]


## RELAY 9~14  J12

set_property PACKAGE_PIN H16 [get_ports {relay[9]}]
set_property PACKAGE_PIN H17 [get_ports {relay[10]}]
set_property PACKAGE_PIN M17 [get_ports {relay[11]}]
set_property PACKAGE_PIN M18 [get_ports {relay[12]}]
set_property PACKAGE_PIN E18 [get_ports {relay[13]}]
set_property PACKAGE_PIN E19 [get_ports {relay[14]}]


set_property IOSTANDARD LVCMOS33 [get_ports {relay[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {relay[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {relay[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {relay[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {relay[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {relay[14]}]





## AD
## AD
## AD

set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad1_data[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports ad1_busy]
set_property IOSTANDARD LVCMOS33 [get_ports ad1_cs]
set_property IOSTANDARD LVCMOS33 [get_ports ad1_rd]
set_property IOSTANDARD LVCMOS33 [get_ports ad_reset]
set_property IOSTANDARD LVCMOS33 [get_ports ad_convstab]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_os[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_os[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad_os[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports ad1_range]


set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_data[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports ad2_busy]
set_property IOSTANDARD LVCMOS33 [get_ports ad2_cs]
set_property IOSTANDARD LVCMOS33 [get_ports ad2_rd]




set_property IOSTANDARD LVCMOS33 [get_ports ad2_reset]
set_property IOSTANDARD LVCMOS33 [get_ports ad2_convstab]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_os[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_os[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ad2_os[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports ad2_range]

set_property IOSTANDARD LVCMOS33 [get_ports {relay[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {relay[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {relay[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {relay[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {relay[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {relay[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {relay[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {relay[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {relay[0]}]

## AD1 J10

set_property PACKAGE_PIN T12 [get_ports {ad1_data[15]}]
set_property PACKAGE_PIN U12 [get_ports {ad1_data[14]}]
set_property PACKAGE_PIN W13 [get_ports {ad1_data[13]}]
set_property PACKAGE_PIN V12 [get_ports {ad1_data[12]}]
set_property PACKAGE_PIN U13 [get_ports {ad1_data[11]}]
set_property PACKAGE_PIN V13 [get_ports {ad1_data[10]}]
set_property PACKAGE_PIN T14 [get_ports {ad1_data[9]}]
set_property PACKAGE_PIN T15 [get_ports {ad1_data[8]}]
set_property PACKAGE_PIN R14 [get_ports {ad1_data[7]}]
set_property PACKAGE_PIN P14 [get_ports {ad1_data[6]}]

set_property PACKAGE_PIN U15 [get_ports {ad1_data[5]}]
set_property PACKAGE_PIN U14 [get_ports {ad1_data[4]}]
set_property PACKAGE_PIN Y14 [get_ports {ad1_data[3]}]
set_property PACKAGE_PIN W14 [get_ports {ad1_data[2]}]
set_property PACKAGE_PIN V15 [get_ports {ad1_data[1]}]
set_property PACKAGE_PIN W15 [get_ports {ad1_data[0]}]

set_property PACKAGE_PIN Y16 [get_ports ad1_busy]
set_property PACKAGE_PIN Y17 [get_ports ad1_cs]
set_property PACKAGE_PIN N18 [get_ports ad1_rd]
set_property PACKAGE_PIN P19 [get_ports ad_reset]
set_property PACKAGE_PIN U17 [get_ports ad_convstab]
set_property PACKAGE_PIN T16 [get_ports {ad_os[2]}]
set_property PACKAGE_PIN P20 [get_ports {ad_os[1]}]
set_property PACKAGE_PIN N20 [get_ports {ad_os[0]}]

set_property PACKAGE_PIN T10 [get_ports ad1_range]

## AD2 J11


set_property PACKAGE_PIN Y19 [get_ports {ad2_data[15]}]
set_property PACKAGE_PIN Y18 [get_ports {ad2_data[14]}]
set_property PACKAGE_PIN W18 [get_ports {ad2_data[13]}]
set_property PACKAGE_PIN W19 [get_ports {ad2_data[12]}]
set_property PACKAGE_PIN V20 [get_ports {ad2_data[11]}]
set_property PACKAGE_PIN W20 [get_ports {ad2_data[10]}]
set_property PACKAGE_PIN R17 [get_ports {ad2_data[9]}]
set_property PACKAGE_PIN R16 [get_ports {ad2_data[8]}]
set_property PACKAGE_PIN L17 [get_ports {ad2_data[7]}]
set_property PACKAGE_PIN L16 [get_ports {ad2_data[6]}]
set_property PACKAGE_PIN J16 [get_ports {ad2_data[5]}]
set_property PACKAGE_PIN K16 [get_ports {ad2_data[4]}]
set_property PACKAGE_PIN T20 [get_ports {ad2_data[3]}]
set_property PACKAGE_PIN U20 [get_ports {ad2_data[2]}]
set_property PACKAGE_PIN R18 [get_ports {ad2_data[1]}]
set_property PACKAGE_PIN T17 [get_ports {ad2_data[0]}]


set_property PACKAGE_PIN M20 [get_ports ad2_busy]
set_property PACKAGE_PIN M19 [get_ports ad2_cs]
set_property PACKAGE_PIN L20 [get_ports ad2_rd]

set_property PACKAGE_PIN L19 [get_ports ad2_reset]
set_property PACKAGE_PIN P15 [get_ports ad2_convstab]
set_property PACKAGE_PIN P16 [get_ports {ad2_os[2]}]
set_property PACKAGE_PIN N17 [get_ports {ad2_os[1]}]
set_property PACKAGE_PIN P18 [get_ports {ad2_os[0]}]

set_property PACKAGE_PIN L15 [get_ports ad2_range]

##RELAY J11



set_property PACKAGE_PIN V17 [get_ports {relay[8]}]
set_property PACKAGE_PIN V18 [get_ports {relay[7]}]
set_property PACKAGE_PIN V16 [get_ports {relay[6]}]
set_property PACKAGE_PIN W16 [get_ports {relay[5]}]
set_property PACKAGE_PIN N15 [get_ports {relay[4]}]
set_property PACKAGE_PIN N16 [get_ports {relay[3]}]
set_property PACKAGE_PIN M14 [get_ports {relay[2]}]
set_property PACKAGE_PIN M15 [get_ports {relay[1]}]
set_property PACKAGE_PIN L14 [get_ports {relay[0]}]











set_input_delay -clock [get_clocks clk_fpga_0] -min -add_delay 4.000 [get_ports {ad1_data[*]}]
set_input_delay -clock [get_clocks clk_fpga_0] -max -add_delay 4.000 [get_ports {ad1_data[*]}]
set_input_delay -clock [get_clocks clk_fpga_0] -min -add_delay 4.000 [get_ports {ad2_data[*]}]
set_input_delay -clock [get_clocks clk_fpga_0] -max -add_delay 4.000 [get_ports {ad2_data[*]}]
set_input_delay -clock [get_clocks clk_fpga_0] -min -add_delay 4.000 [get_ports ad1_busy]
set_input_delay -clock [get_clocks clk_fpga_0] -max -add_delay 4.000 [get_ports ad1_busy]
set_input_delay -clock [get_clocks clk_fpga_0] -min -add_delay 4.000 [get_ports ad2_busy]
set_input_delay -clock [get_clocks clk_fpga_0] -max -add_delay 4.000 [get_ports ad2_busy]
set_input_delay -clock [get_clocks clk_fpga_0] -min -add_delay 4.000 [get_ports {lcd_int_tri_i[0]}]
set_input_delay -clock [get_clocks clk_fpga_0] -max -add_delay 4.000 [get_ports {lcd_int_tri_i[0]}]
create_clock -period 10.000 -name VIRTUAL_vid_io_out_clk_OBUF -waveform {0.000 4.000}
set_output_delay -clock [get_clocks clk_fpga_0] -min -add_delay -1.000 [get_ports {relay[*]}]
set_output_delay -clock [get_clocks clk_fpga_0] -max -add_delay 2.000 [get_ports {relay[*]}]
set_output_delay -clock [get_clocks VIRTUAL_vid_io_out_clk_OBUF] -min -add_delay -1.000 [get_ports {vid_data[*]}]
set_output_delay -clock [get_clocks VIRTUAL_vid_io_out_clk_OBUF] -max -add_delay 2.000 [get_ports {vid_data[*]}]
set_output_delay -clock [get_clocks clk_fpga_0] -min -add_delay -1.000 [get_ports ad1_cs]
set_output_delay -clock [get_clocks clk_fpga_0] -max -add_delay 2.000 [get_ports ad1_cs]
set_output_delay -clock [get_clocks clk_fpga_0] -min -add_delay -1.000 [get_ports ad1_rd]
set_output_delay -clock [get_clocks clk_fpga_0] -max -add_delay 2.000 [get_ports ad1_rd]
set_output_delay -clock [get_clocks clk_fpga_0] -min -add_delay -1.000 [get_ports ad2_convstab]
set_output_delay -clock [get_clocks clk_fpga_0] -max -add_delay 2.000 [get_ports ad2_convstab]
set_output_delay -clock [get_clocks clk_fpga_0] -min -add_delay -1.000 [get_ports ad2_cs]
set_output_delay -clock [get_clocks clk_fpga_0] -max -add_delay 2.000 [get_ports ad2_cs]
set_output_delay -clock [get_clocks clk_fpga_0] -min -add_delay -1.000 [get_ports ad2_rd]
set_output_delay -clock [get_clocks clk_fpga_0] -max -add_delay 2.000 [get_ports ad2_rd]
set_output_delay -clock [get_clocks clk_fpga_0] -min -add_delay -1.000 [get_ports ad2_reset]
set_output_delay -clock [get_clocks clk_fpga_0] -max -add_delay 2.000 [get_ports ad2_reset]
set_output_delay -clock [get_clocks clk_fpga_0] -min -add_delay -1.000 [get_ports ad_convstab]
set_output_delay -clock [get_clocks clk_fpga_0] -max -add_delay 2.000 [get_ports ad_convstab]
set_output_delay -clock [get_clocks clk_fpga_0] -min -add_delay -1.000 [get_ports ad_reset]
set_output_delay -clock [get_clocks clk_fpga_0] -max -add_delay 2.000 [get_ports ad_reset]
set_output_delay -clock [get_clocks clk_fpga_0] -min -add_delay -1.000 [get_ports lcd_bl_pwm]
set_output_delay -clock [get_clocks clk_fpga_0] -max -add_delay 2.000 [get_ports lcd_bl_pwm]
set_output_delay -clock [get_clocks VIRTUAL_vid_io_out_clk_OBUF] -min -add_delay -1.000 [get_ports vid_active_video]
set_output_delay -clock [get_clocks VIRTUAL_vid_io_out_clk_OBUF] -max -add_delay 2.000 [get_ports vid_active_video]
set_output_delay -clock [get_clocks VIRTUAL_vid_io_out_clk_OBUF] -min -add_delay -1.000 [get_ports vid_hsync]
set_output_delay -clock [get_clocks VIRTUAL_vid_io_out_clk_OBUF] -max -add_delay 2.000 [get_ports vid_hsync]
set_output_delay -clock [get_clocks VIRTUAL_vid_io_out_clk_OBUF] -min -add_delay -1.000 [get_ports vid_vsync]
set_output_delay -clock [get_clocks VIRTUAL_vid_io_out_clk_OBUF] -max -add_delay 2.000 [get_ports vid_vsync]



