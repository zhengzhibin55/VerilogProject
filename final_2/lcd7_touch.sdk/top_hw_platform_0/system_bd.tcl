
################################################################
# This is a generated script based on design: system
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source system_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z020clg400-2

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name system

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set lcd_iic [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 lcd_iic ]
  set lcd_int [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 lcd_int ]

  # Create ports
  set ad1_busy [ create_bd_port -dir I ad1_busy ]
  set ad1_cs [ create_bd_port -dir O ad1_cs ]
  set ad1_data [ create_bd_port -dir I -from 15 -to 0 ad1_data ]
  set ad1_range [ create_bd_port -dir O ad1_range ]
  set ad1_rd [ create_bd_port -dir O ad1_rd ]
  set ad2_busy [ create_bd_port -dir I ad2_busy ]
  set ad2_convstab [ create_bd_port -dir O ad2_convstab ]
  set ad2_cs [ create_bd_port -dir O ad2_cs ]
  set ad2_data [ create_bd_port -dir I -from 15 -to 0 ad2_data ]
  set ad2_os [ create_bd_port -dir O -from 2 -to 0 ad2_os ]
  set ad2_range [ create_bd_port -dir O ad2_range ]
  set ad2_rd [ create_bd_port -dir O ad2_rd ]
  set ad2_reset [ create_bd_port -dir O -type rst ad2_reset ]
  set ad_convstab [ create_bd_port -dir O ad_convstab ]
  set ad_os [ create_bd_port -dir O -from 2 -to 0 ad_os ]
  set ad_reset [ create_bd_port -dir O -type rst ad_reset ]
  set lcd_bl_pwm [ create_bd_port -dir O lcd_bl_pwm ]
  set relay [ create_bd_port -dir O -from 14 -to 0 relay ]
  set vid_active_video [ create_bd_port -dir O vid_active_video ]
  set vid_data [ create_bd_port -dir O -from 17 -to 0 vid_data ]
  set vid_hsync [ create_bd_port -dir O vid_hsync ]
  set vid_io_out_clk [ create_bd_port -dir O -type clk vid_io_out_clk ]
  set vid_vsync [ create_bd_port -dir O vid_vsync ]

  # Create instance: PinRedistribution_0, and set properties
  set PinRedistribution_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:PinRedistribution:1.0 PinRedistribution_0 ]

  # Create instance: ad_fft_0, and set properties
  set ad_fft_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:ad_fft:1.0 ad_fft_0 ]

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 axi_bram_ctrl_0 ]

  # Create instance: axi_dynclk_0, and set properties
  set axi_dynclk_0 [ create_bd_cell -type ip -vlnv digilentinc.com:ip:axi_dynclk:1.0 axi_dynclk_0 ]

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
CONFIG.C_ALL_INPUTS {1} \
CONFIG.C_GPIO_WIDTH {1} \
CONFIG.C_INTERRUPT_PRESENT {1} \
 ] $axi_gpio_0

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
 ] $axi_mem_intercon

  # Create instance: axi_vdma_0, and set properties
  set axi_vdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.2 axi_vdma_0 ]
  set_property -dict [ list \
CONFIG.c_include_mm2s_dre {1} \
CONFIG.c_include_s2mm {0} \
CONFIG.c_mm2s_genlock_mode {0} \
CONFIG.c_mm2s_linebuffer_depth {4096} \
CONFIG.c_num_fstores {1} \
CONFIG.c_s2mm_genlock_mode {0} \
 ] $axi_vdma_0

  # Create instance: axis_subset_converter_0, and set properties
  set axis_subset_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 axis_subset_converter_0 ]
  set_property -dict [ list \
CONFIG.M_HAS_TKEEP {1} \
CONFIG.M_HAS_TLAST {1} \
CONFIG.M_TDATA_NUM_BYTES {3} \
CONFIG.M_TUSER_WIDTH {1} \
CONFIG.S_HAS_TKEEP {1} \
CONFIG.S_HAS_TLAST {1} \
CONFIG.S_TDATA_NUM_BYTES {4} \
CONFIG.S_TUSER_WIDTH {1} \
CONFIG.TDATA_REMAP {tdata[23:16],tdata[15:8],tdata[7:0]} \
CONFIG.TKEEP_REMAP {tkeep[2:0]} \
CONFIG.TLAST_REMAP {tlast[0]} \
CONFIG.TUSER_REMAP {tuser[0:0]} \
 ] $axis_subset_converter_0

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_0 ]
  set_property -dict [ list \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Use_RSTB_Pin {true} \
 ] $blk_mem_gen_0

  # Create instance: blk_mem_gen_1, and set properties
  set blk_mem_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_1 ]
  set_property -dict [ list \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Use_RSTB_Pin {true} \
 ] $blk_mem_gen_1

  # Create instance: fft_reset1_0, and set properties
  set fft_reset1_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:fft_reset1:1.0 fft_reset1_0 ]

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: proc_sys_reset_1, and set properties
  set proc_sys_reset_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_1 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {767} \
CONFIG.PCW_EN_CLK1_PORT {1} \
CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {150} \
CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_I2C1_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_IRQ_F2P_INTR {1} \
CONFIG.PCW_MIO_1_SLEW {fast} \
CONFIG.PCW_MIO_2_SLEW {fast} \
CONFIG.PCW_MIO_3_SLEW {fast} \
CONFIG.PCW_MIO_40_SLEW {fast} \
CONFIG.PCW_MIO_41_SLEW {fast} \
CONFIG.PCW_MIO_42_SLEW {fast} \
CONFIG.PCW_MIO_43_SLEW {fast} \
CONFIG.PCW_MIO_44_SLEW {fast} \
CONFIG.PCW_MIO_45_SLEW {fast} \
CONFIG.PCW_MIO_4_SLEW {fast} \
CONFIG.PCW_MIO_5_SLEW {fast} \
CONFIG.PCW_MIO_6_SLEW {fast} \
CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6} \
CONFIG.PCW_SD0_GRP_CD_ENABLE {1} \
CONFIG.PCW_SD0_GRP_CD_IO {MIO 47} \
CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45} \
CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_TTC1_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UART1_UART1_IO {MIO 48 .. 49} \
CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41J256M16 RE-125} \
CONFIG.PCW_USE_CROSS_TRIGGER {0} \
CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
CONFIG.PCW_USE_S_AXI_HP0 {1} \
 ] $processing_system7_0

  # Create instance: processing_system7_0_axi_periph, and set properties
  set processing_system7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 processing_system7_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {5} \
 ] $processing_system7_0_axi_periph

  # Create instance: pwm_0, and set properties
  set pwm_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:pwm:1.0 pwm_0 ]

  # Create instance: r_ram_0, and set properties
  set r_ram_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:r_ram:1.0 r_ram_0 ]

  # Create instance: reset_0, and set properties
  set reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:reset:1.0 reset_0 ]

  # Create instance: v_axi4s_vid_out_0, and set properties
  set v_axi4s_vid_out_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_axi4s_vid_out:4.0 v_axi4s_vid_out_0 ]
  set_property -dict [ list \
CONFIG.C_ADDR_WIDTH {12} \
CONFIG.C_HAS_ASYNC_CLK {1} \
CONFIG.C_S_AXIS_VIDEO_DATA_WIDTH {8} \
CONFIG.C_S_AXIS_VIDEO_FORMAT {2} \
CONFIG.C_VTG_MASTER_SLAVE {1} \
 ] $v_axi4s_vid_out_0

  # Create instance: v_tc_0, and set properties
  set v_tc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_tc:6.1 v_tc_0 ]
  set_property -dict [ list \
CONFIG.enable_detection {false} \
 ] $v_tc_0

  # Create instance: w_ram_0, and set properties
  set w_ram_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:w_ram:1.0 w_ram_0 ]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {3} \
 ] $xlconcat_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_2

  # Create interface connections
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTB [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTB] [get_bd_intf_pins blk_mem_gen_1/BRAM_PORTB]
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO [get_bd_intf_ports lcd_int] [get_bd_intf_pins axi_gpio_0/GPIO]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net axi_vdma_0_M_AXIS_MM2S [get_bd_intf_pins axi_vdma_0/M_AXIS_MM2S] [get_bd_intf_pins axis_subset_converter_0/S_AXIS]
  connect_bd_intf_net -intf_net axi_vdma_0_M_AXI_MM2S [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins axi_vdma_0/M_AXI_MM2S]
  connect_bd_intf_net -intf_net axis_subset_converter_0_M_AXIS [get_bd_intf_pins axis_subset_converter_0/M_AXIS] [get_bd_intf_pins v_axi4s_vid_out_0/video_in]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_IIC_0 [get_bd_intf_ports lcd_iic] [get_bd_intf_pins processing_system7_0/IIC_0]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins processing_system7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins axi_vdma_0/S_AXI_LITE] [get_bd_intf_pins processing_system7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M01_AXI [get_bd_intf_pins processing_system7_0_axi_periph/M01_AXI] [get_bd_intf_pins v_tc_0/ctrl]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M02_AXI [get_bd_intf_pins axi_dynclk_0/s00_axi] [get_bd_intf_pins processing_system7_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M03_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M04_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net v_tc_0_vtiming_out [get_bd_intf_pins v_axi4s_vid_out_0/vtiming_in] [get_bd_intf_pins v_tc_0/vtiming_out]

  # Create port connections
  connect_bd_net -net PinRedistribution_0_vid_data [get_bd_ports vid_data] [get_bd_pins PinRedistribution_0/vid_data]
  connect_bd_net -net ad1_busy_1 [get_bd_ports ad1_busy] [get_bd_pins ad_fft_0/ad1_busy]
  connect_bd_net -net ad1_data_1 [get_bd_ports ad1_data] [get_bd_pins ad_fft_0/ad1_data]
  connect_bd_net -net ad2_busy_1 [get_bd_ports ad2_busy] [get_bd_pins ad_fft_0/ad2_busy]
  connect_bd_net -net ad2_data_1 [get_bd_ports ad2_data] [get_bd_pins ad_fft_0/ad2_data]
  connect_bd_net -net ad_fft_0_ad1_cs [get_bd_ports ad1_cs] [get_bd_pins ad_fft_0/ad1_cs]
  connect_bd_net -net ad_fft_0_ad1_range [get_bd_ports ad1_range] [get_bd_pins ad_fft_0/ad1_range]
  connect_bd_net -net ad_fft_0_ad1_rd [get_bd_ports ad1_rd] [get_bd_pins ad_fft_0/ad1_rd]
  connect_bd_net -net ad_fft_0_ad2_convstab [get_bd_ports ad2_convstab] [get_bd_pins ad_fft_0/ad2_convstab]
  connect_bd_net -net ad_fft_0_ad2_cs [get_bd_ports ad2_cs] [get_bd_pins ad_fft_0/ad2_cs]
  connect_bd_net -net ad_fft_0_ad2_os [get_bd_ports ad2_os] [get_bd_pins ad_fft_0/ad2_os]
  connect_bd_net -net ad_fft_0_ad2_range [get_bd_ports ad2_range] [get_bd_pins ad_fft_0/ad2_range]
  connect_bd_net -net ad_fft_0_ad2_rd [get_bd_ports ad2_rd] [get_bd_pins ad_fft_0/ad2_rd]
  connect_bd_net -net ad_fft_0_ad2_reset [get_bd_ports ad2_reset] [get_bd_pins ad_fft_0/ad2_reset]
  connect_bd_net -net ad_fft_0_ad_convstab [get_bd_ports ad_convstab] [get_bd_pins ad_fft_0/ad_convstab]
  connect_bd_net -net ad_fft_0_ad_os [get_bd_ports ad_os] [get_bd_pins ad_fft_0/ad_os]
  connect_bd_net -net ad_fft_0_ad_reset [get_bd_ports ad_reset] [get_bd_pins ad_fft_0/ad_reset]
  connect_bd_net -net ad_fft_0_done [get_bd_pins ad_fft_0/done] [get_bd_pins w_ram_0/done]
  connect_bd_net -net ad_fft_0_fft_data [get_bd_pins ad_fft_0/fft_data] [get_bd_pins w_ram_0/fft_data]
  connect_bd_net -net axi_dynclk_0_PXL_CLK_O1 [get_bd_ports vid_io_out_clk] [get_bd_pins axi_dynclk_0/PXL_CLK_O] [get_bd_pins v_axi4s_vid_out_0/vid_io_out_clk] [get_bd_pins v_tc_0/clk]
  connect_bd_net -net axi_gpio_0_ip2intc_irpt [get_bd_pins axi_gpio_0/ip2intc_irpt] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net axi_vdma_0_mm2s_introut [get_bd_pins axi_vdma_0/mm2s_introut] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net blk_mem_gen_0_doutb [get_bd_pins blk_mem_gen_0/doutb] [get_bd_pins fft_reset1_0/doutb] [get_bd_pins r_ram_0/doutb]
  connect_bd_net -net blk_mem_gen_1_douta [get_bd_pins blk_mem_gen_1/douta] [get_bd_pins w_ram_0/douta]
  connect_bd_net -net fft_reset1_0_choise [get_bd_pins fft_reset1_0/choise] [get_bd_pins w_ram_0/choise]
  connect_bd_net -net fft_reset1_0_fft_reset [get_bd_pins ad_fft_0/fft_reset] [get_bd_pins fft_reset1_0/fft_reset] [get_bd_pins w_ram_0/fft_reset]
  connect_bd_net -net fft_reset1_0_relay [get_bd_ports relay] [get_bd_pins fft_reset1_0/relay]
  connect_bd_net -net fft_reset1_0_reset_done [get_bd_pins fft_reset1_0/reset_done] [get_bd_pins w_ram_0/reset_done]
  connect_bd_net -net fft_reset1_0_reset_i [get_bd_pins fft_reset1_0/reset_i] [get_bd_pins w_ram_0/reset_i]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins ad_fft_0/clk] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_dynclk_0/REF_CLK_I] [get_bd_pins axi_dynclk_0/s00_axi_aclk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_vdma_0/s_axi_lite_aclk] [get_bd_pins fft_reset1_0/clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0_axi_periph/ACLK] [get_bd_pins processing_system7_0_axi_periph/M00_ACLK] [get_bd_pins processing_system7_0_axi_periph/M01_ACLK] [get_bd_pins processing_system7_0_axi_periph/M02_ACLK] [get_bd_pins processing_system7_0_axi_periph/M03_ACLK] [get_bd_pins processing_system7_0_axi_periph/M04_ACLK] [get_bd_pins processing_system7_0_axi_periph/S00_ACLK] [get_bd_pins pwm_0/clk] [get_bd_pins r_ram_0/clk] [get_bd_pins reset_0/clk] [get_bd_pins v_tc_0/s_axi_aclk] [get_bd_pins w_ram_0/clk]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_vdma_0/m_axi_mm2s_aclk] [get_bd_pins axi_vdma_0/m_axis_mm2s_aclk] [get_bd_pins axis_subset_converter_0/aclk] [get_bd_pins proc_sys_reset_1/slowest_sync_clk] [get_bd_pins processing_system7_0/FCLK_CLK1] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins v_axi4s_vid_out_0/aclk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins proc_sys_reset_1/ext_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
  connect_bd_net -net pwm_0_lcd_bl_pwm [get_bd_ports lcd_bl_pwm] [get_bd_pins pwm_0/lcd_bl_pwm]
  connect_bd_net -net r_ram_0_addrb [get_bd_pins blk_mem_gen_0/addrb] [get_bd_pins r_ram_0/addrb]
  connect_bd_net -net r_ram_0_clkb [get_bd_pins blk_mem_gen_0/clkb] [get_bd_pins r_ram_0/clkb]
  connect_bd_net -net r_ram_0_dinb [get_bd_pins blk_mem_gen_0/dinb] [get_bd_pins r_ram_0/dinb]
  connect_bd_net -net r_ram_0_enb [get_bd_pins blk_mem_gen_0/enb] [get_bd_pins r_ram_0/enb]
  connect_bd_net -net r_ram_0_rstb [get_bd_pins blk_mem_gen_0/rstb] [get_bd_pins r_ram_0/rstb]
  connect_bd_net -net r_ram_0_web [get_bd_pins blk_mem_gen_0/web] [get_bd_pins r_ram_0/web]
  connect_bd_net -net reset_0_reset [get_bd_pins fft_reset1_0/reset] [get_bd_pins r_ram_0/reset] [get_bd_pins reset_0/reset]
  connect_bd_net -net rst_processing_system7_0_100M_interconnect_aresetn [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins processing_system7_0_axi_periph/ARESETN]
  connect_bd_net -net rst_processing_system7_0_100M_peripheral_aresetn [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_dynclk_0/s00_axi_aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_vdma_0/axi_resetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins processing_system7_0_axi_periph/M00_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M01_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M02_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M03_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M04_ARESETN] [get_bd_pins processing_system7_0_axi_periph/S00_ARESETN] [get_bd_pins v_tc_0/s_axi_aresetn]
  connect_bd_net -net rst_processing_system7_0_140M_interconnect_aresetn [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins proc_sys_reset_1/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_140M_peripheral_aresetn [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins proc_sys_reset_1/peripheral_aresetn]
  connect_bd_net -net v_axi4s_vid_out_0_vid_active_video [get_bd_ports vid_active_video] [get_bd_pins v_axi4s_vid_out_0/vid_active_video]
  connect_bd_net -net v_axi4s_vid_out_0_vid_data [get_bd_pins PinRedistribution_0/vid_in] [get_bd_pins v_axi4s_vid_out_0/vid_data]
  connect_bd_net -net v_axi4s_vid_out_0_vid_hsync [get_bd_ports vid_hsync] [get_bd_pins v_axi4s_vid_out_0/vid_hsync]
  connect_bd_net -net v_axi4s_vid_out_0_vtg_ce [get_bd_pins v_axi4s_vid_out_0/vtg_ce] [get_bd_pins v_tc_0/gen_clken]
  connect_bd_net -net v_tc_0_irq [get_bd_pins v_tc_0/irq] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net vid_vsync [get_bd_ports vid_vsync] [get_bd_pins v_axi4s_vid_out_0/vid_vsync]
  connect_bd_net -net w_ram_0_addra [get_bd_pins blk_mem_gen_1/addra] [get_bd_pins w_ram_0/addra]
  connect_bd_net -net w_ram_0_clka [get_bd_pins blk_mem_gen_1/clka] [get_bd_pins w_ram_0/clka]
  connect_bd_net -net w_ram_0_dina [get_bd_pins blk_mem_gen_1/dina] [get_bd_pins w_ram_0/dina]
  connect_bd_net -net w_ram_0_ena [get_bd_pins blk_mem_gen_1/ena] [get_bd_pins w_ram_0/ena]
  connect_bd_net -net w_ram_0_ram_done [get_bd_pins fft_reset1_0/ram_done] [get_bd_pins w_ram_0/ram_done]
  connect_bd_net -net w_ram_0_rsta [get_bd_pins blk_mem_gen_1/rsta] [get_bd_pins w_ram_0/rsta]
  connect_bd_net -net w_ram_0_wea [get_bd_pins blk_mem_gen_1/wea] [get_bd_pins w_ram_0/wea]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins processing_system7_0/IRQ_F2P] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins axis_subset_converter_0/aresetn] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins pwm_0/rst] [get_bd_pins xlconstant_2/dout]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_vdma_0/Data_MM2S] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x2000 -offset 0x40000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x10000 -offset 0x43C10000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_dynclk_0/s00_axi/reg0] SEG_axi_dynclk_0_reg0
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x43000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_vdma_0/S_AXI_LITE/Reg] SEG_axi_vdma_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs v_tc_0/ctrl/Reg] SEG_v_tc_0_Reg

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port vid_io_out_clk -pg 1 -y 280 -defaultsOSRD
preplace port DDR -pg 1 -lvl 4:130 -defaultsOSRD -top
preplace port ad1_rd -pg 1 -y 1660 -defaultsOSRD
preplace port ad1_cs -pg 1 -y 1640 -defaultsOSRD
preplace port lcd_int -pg 1 -y 420 -defaultsOSRD
preplace port ad1_range -pg 1 -y 1840 -defaultsOSRD
preplace port ad2_busy -pg 1 -y 1800 -defaultsOSRD
preplace port ad1_busy -pg 1 -y 1760 -defaultsOSRD
preplace port lcd_iic -pg 1 -lvl 4:170 -defaultsOSRD -top
preplace port lcd_bl_pwm -pg 1 -y 1550 -defaultsOSRD
preplace port FIXED_IO -pg 1 -lvl 4:150 -defaultsOSRD -top
preplace port ad2_cs -pg 1 -y 1740 -defaultsOSRD
preplace port ad2_range -pg 1 -y 1860 -defaultsOSRD
preplace port ad_reset -pg 1 -y 1680 -defaultsOSRD
preplace port ad2_convstab -pg 1 -y 1800 -defaultsOSRD
preplace port ad2_rd -pg 1 -y 1760 -defaultsOSRD
preplace port vid_hsync -pg 1 -y 660 -defaultsOSRD
preplace port ad_convstab -pg 1 -y 1700 -defaultsOSRD
preplace port ad2_reset -pg 1 -y 1780 -defaultsOSRD
preplace port vid_vsync -pg 1 -y 700 -defaultsOSRD
preplace port vid_active_video -pg 1 -y 560 -defaultsOSRD
preplace portBus ad2_os -pg 1 -y 1820 -defaultsOSRD
preplace portBus ad2_data -pg 1 -y 1780 -defaultsOSRD
preplace portBus ad1_data -pg 1 -y 1740 -defaultsOSRD
preplace portBus vid_data -pg 1 -y 620 -defaultsOSRD
preplace portBus relay -pg 1 -y 1490 -defaultsOSRD
preplace portBus ad_os -pg 1 -y 1720 -defaultsOSRD
preplace inst v_axi4s_vid_out_0 -pg 1 -lvl 7 -y 720 -defaultsOSRD
preplace inst fft_reset1_0 -pg 1 -lvl 7 -y 1570 -defaultsOSRD
preplace inst ad_fft_0 -pg 1 -lvl 8 -y 1770 -defaultsOSRD
preplace inst v_tc_0 -pg 1 -lvl 6 -y 580 -defaultsOSRD
preplace inst axi_vdma_0 -pg 1 -lvl 2 -y 600 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 5 -y 820 -defaultsOSRD
preplace inst xlconstant_2 -pg 1 -lvl 7 -y 1720 -defaultsOSRD
preplace inst PinRedistribution_0 -pg 1 -lvl 8 -y 620 -defaultsOSRD
preplace inst w_ram_0 -pg 1 -lvl 6 -y 1330 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 3 -y 620 -defaultsOSRD
preplace inst proc_sys_reset_0 -pg 1 -lvl 1 -y 700 -defaultsOSRD
preplace inst axi_gpio_0 -pg 1 -lvl 7 -y 360 -defaultsOSRD
preplace inst blk_mem_gen_0 -pg 1 -lvl 7 -y 1080 -defaultsOSRD
preplace inst proc_sys_reset_1 -pg 1 -lvl 2 -y 390 -defaultsOSRD
preplace inst blk_mem_gen_1 -pg 1 -lvl 7 -y 1350 -defaultsOSRD
preplace inst axis_subset_converter_0 -pg 1 -lvl 6 -y 790 -defaultsOSRD
preplace inst axi_dynclk_0 -pg 1 -lvl 7 -y 230 -defaultsOSRD
preplace inst pwm_0 -pg 1 -lvl 8 -y 1550 -defaultsOSRD
preplace inst reset_0 -pg 1 -lvl 5 -y 930 -defaultsOSRD
preplace inst r_ram_0 -pg 1 -lvl 6 -y 1080 -defaultsOSRD
preplace inst axi_bram_ctrl_0 -pg 1 -lvl 6 -y 930 -defaultsOSRD
preplace inst axi_mem_intercon -pg 1 -lvl 3 -y 370 -defaultsOSRD
preplace inst processing_system7_0_axi_periph -pg 1 -lvl 5 -y 520 -defaultsOSRD
preplace inst processing_system7_0 -pg 1 -lvl 4 -y 310 -defaultsOSRD
preplace netloc axi_vdma_0_M_AXI_MM2S 1 2 1 700
preplace netloc processing_system7_0_FIXED_IO 1 4 1 1470
preplace netloc r_ram_0_dinb 1 6 1 2290
preplace netloc ad_fft_0_fft_data 1 5 4 1920 1210 NJ 1220 NJ 1220 2960
preplace netloc ad1_data_1 1 0 8 NJ 1740 NJ 1740 NJ 1740 NJ 1740 NJ 1740 NJ 1740 NJ 1800 NJ
preplace netloc axi_vdma_0_M_AXIS_MM2S 1 2 4 720 540 NJ 540 NJ 310 NJ
preplace netloc ad1_busy_1 1 0 8 NJ 1760 NJ 1760 NJ 1760 NJ 1760 NJ 1760 NJ 1760 NJ 1770 NJ
preplace netloc xlconcat_0_dout 1 3 1 1060
preplace netloc v_tc_0_vtiming_out 1 6 1 2280
preplace netloc r_ram_0_web 1 6 1 2220
preplace netloc vid_vsync 1 7 2 NJ 700 NJ
preplace netloc reset_0_reset 1 5 2 1840 1190 NJ
preplace netloc ad_fft_0_ad_os 1 8 1 NJ
preplace netloc fft_reset1_0_fft_reset 1 5 3 1860 1820 NJ 1820 2640
preplace netloc w_ram_0_addra 1 6 1 N
preplace netloc rst_processing_system7_0_140M_peripheral_aresetn 1 2 1 730
preplace netloc r_ram_0_clkb 1 6 1 2290
preplace netloc axi_gpio_0_GPIO 1 7 2 NJ 350 NJ
preplace netloc fft_reset1_0_reset_done 1 5 3 1890 1480 NJ 1480 2620
preplace netloc processing_system7_0_DDR 1 4 1 1460
preplace netloc ad_fft_0_ad1_cs 1 8 1 NJ
preplace netloc ad_fft_0_done 1 5 4 1880 1200 NJ 1210 NJ 1210 2970
preplace netloc w_ram_0_ena 1 6 1 2210
preplace netloc axi_dynclk_0_PXL_CLK_O1 1 5 4 1920 450 2290 450 2650 280 NJ
preplace netloc fft_reset1_0_choise 1 5 3 1900 1660 NJ 1660 2630
preplace netloc processing_system7_0_FCLK_RESET0_N 1 0 5 10 480 340 480 NJ 510 NJ 510 1460
preplace netloc ad_fft_0_ad2_convstab 1 8 1 NJ
preplace netloc blk_mem_gen_1_douta 1 5 2 1920 1450 NJ
preplace netloc ad2_busy_1 1 0 8 NJ 1800 NJ 1800 NJ 1800 NJ 1800 NJ 1800 NJ 1800 NJ 1810 NJ
preplace netloc axi_bram_ctrl_0_BRAM_PORTA 1 6 1 2290
preplace netloc processing_system7_0_axi_periph_M03_AXI 1 5 1 1850
preplace netloc processing_system7_0_axi_periph_M02_AXI 1 5 2 1860 200 NJ
preplace netloc axi_bram_ctrl_0_BRAM_PORTB 1 6 1 2250
preplace netloc axi_gpio_0_ip2intc_irpt 1 2 6 740 500 NJ 500 NJ 150 NJ 150 NJ 150 2640
preplace netloc fft_reset1_0_reset_i 1 5 3 1910 1670 NJ 1670 2620
preplace netloc ad_fft_0_ad2_reset 1 8 1 NJ
preplace netloc PinRedistribution_0_vid_data 1 8 1 N
preplace netloc axi_vdma_0_mm2s_introut 1 2 1 710
preplace netloc xlconstant_2_dout 1 7 1 NJ
preplace netloc processing_system7_0_IIC_0 1 4 1 1480
preplace netloc w_ram_0_wea 1 6 1 2180
preplace netloc processing_system7_0_axi_periph_M01_AXI 1 5 1 N
preplace netloc ad_fft_0_ad2_rd 1 8 1 NJ
preplace netloc ad_fft_0_ad_convstab 1 8 1 NJ
preplace netloc processing_system7_0_FCLK_CLK0 1 0 8 20 580 350 490 NJ 490 1040 560 1550 280 1870 720 2260 1790 2670
preplace netloc fft_reset1_0_relay 1 7 2 NJ 1490 NJ
preplace netloc w_ram_0_rsta 1 6 1 2200
preplace netloc processing_system7_0_FCLK_CLK1 1 1 6 360 300 740 250 1050 490 1500 290 1890 710 NJ
preplace netloc ad_fft_0_ad2_cs 1 8 1 NJ
preplace netloc rst_processing_system7_0_100M_interconnect_aresetn 1 1 4 NJ 500 NJ 530 NJ 530 1560
preplace netloc w_ram_0_clka 1 6 1 N
preplace netloc processing_system7_0_axi_periph_M00_AXI 1 1 5 370 510 NJ 520 NJ 520 NJ 320 1850
preplace netloc r_ram_0_addrb 1 6 1 2290
preplace netloc ad_fft_0_ad2_os 1 8 1 NJ
preplace netloc v_axi4s_vid_out_0_vid_active_video 1 7 2 NJ 560 NJ
preplace netloc v_tc_0_irq 1 2 5 750 550 NJ 550 NJ 270 NJ 270 2220
preplace netloc rst_processing_system7_0_140M_interconnect_aresetn 1 2 1 720
preplace netloc v_axi4s_vid_out_0_vid_data 1 7 1 2650
preplace netloc ad_fft_0_ad2_range 1 8 1 NJ
preplace netloc w_ram_0_ram_done 1 6 1 2190
preplace netloc w_ram_0_dina 1 6 1 N
preplace netloc ad_fft_0_ad_reset 1 8 1 NJ
preplace netloc v_axi4s_vid_out_0_vtg_ce 1 5 3 1920 860 NJ 890 2640
preplace netloc v_axi4s_vid_out_0_vid_hsync 1 7 2 NJ 690 NJ
preplace netloc pwm_0_lcd_bl_pwm 1 8 1 NJ
preplace netloc r_ram_0_enb 1 6 1 2280
preplace netloc ad2_data_1 1 0 8 NJ 1780 NJ 1780 NJ 1780 NJ 1780 NJ 1780 NJ 1780 NJ 1780 NJ
preplace netloc processing_system7_0_M_AXI_GP0 1 4 1 1510
preplace netloc xlconstant_0_dout 1 5 1 NJ
preplace netloc axis_subset_converter_0_M_AXIS 1 6 1 2220
preplace netloc ad_fft_0_ad1_range 1 8 1 NJ
preplace netloc blk_mem_gen_0_doutb 1 5 2 1920 1180 2290
preplace netloc axi_mem_intercon_M00_AXI 1 3 1 1030
preplace netloc r_ram_0_rstb 1 6 1 2270
preplace netloc processing_system7_0_axi_periph_M04_AXI 1 5 2 1840 340 NJ
preplace netloc rst_processing_system7_0_100M_peripheral_aresetn 1 1 6 360 690 NJ 690 NJ 660 1520 260 1900 260 2290
preplace netloc ad_fft_0_ad1_rd 1 8 1 NJ
levelinfo -pg 1 -10 180 540 890 1260 1700 2050 2470 2830 2990 -top 0 -bot 1950
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


