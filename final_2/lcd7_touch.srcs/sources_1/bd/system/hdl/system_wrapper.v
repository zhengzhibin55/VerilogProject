//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
//Date        : Wed Nov 21 20:23:11 2018
//Host        : zheng-PC running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    ad1_busy,
    ad1_cs,
    ad1_data,
    ad1_range,
    ad1_rd,
    ad2_busy,
    ad2_convstab,
    ad2_cs,
    ad2_data,
    ad2_os,
    ad2_range,
    ad2_rd,
    ad2_reset,
    ad_convstab,
    ad_os,
    ad_reset,
    lcd_bl_pwm,
    lcd_iic_scl_io,
    lcd_iic_sda_io,
    lcd_int_tri_i,
    relay,
    vid_active_video,
    vid_data,
    vid_hsync,
    vid_io_out_clk,
    vid_vsync);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  input ad1_busy;
  output ad1_cs;
  input [15:0]ad1_data;
  output ad1_range;
  output ad1_rd;
  input ad2_busy;
  output ad2_convstab;
  output ad2_cs;
  input [15:0]ad2_data;
  output [2:0]ad2_os;
  output ad2_range;
  output ad2_rd;
  output ad2_reset;
  output ad_convstab;
  output [2:0]ad_os;
  output ad_reset;
  output lcd_bl_pwm;
  inout lcd_iic_scl_io;
  inout lcd_iic_sda_io;
  input [0:0]lcd_int_tri_i;
  output [14:0]relay;
  output vid_active_video;
  output [17:0]vid_data;
  output vid_hsync;
  output vid_io_out_clk;
  output vid_vsync;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire ad1_busy;
  wire ad1_cs;
  wire [15:0]ad1_data;
  wire ad1_range;
  wire ad1_rd;
  wire ad2_busy;
  wire ad2_convstab;
  wire ad2_cs;
  wire [15:0]ad2_data;
  wire [2:0]ad2_os;
  wire ad2_range;
  wire ad2_rd;
  wire ad2_reset;
  wire ad_convstab;
  wire [2:0]ad_os;
  wire ad_reset;
  wire lcd_bl_pwm;
  wire lcd_iic_scl_i;
  wire lcd_iic_scl_io;
  wire lcd_iic_scl_o;
  wire lcd_iic_scl_t;
  wire lcd_iic_sda_i;
  wire lcd_iic_sda_io;
  wire lcd_iic_sda_o;
  wire lcd_iic_sda_t;
  wire [0:0]lcd_int_tri_i;
  wire [14:0]relay;
  wire vid_active_video;
  wire [17:0]vid_data;
  wire vid_hsync;
  wire vid_io_out_clk;
  wire vid_vsync;

  IOBUF lcd_iic_scl_iobuf
       (.I(lcd_iic_scl_o),
        .IO(lcd_iic_scl_io),
        .O(lcd_iic_scl_i),
        .T(lcd_iic_scl_t));
  IOBUF lcd_iic_sda_iobuf
       (.I(lcd_iic_sda_o),
        .IO(lcd_iic_sda_io),
        .O(lcd_iic_sda_i),
        .T(lcd_iic_sda_t));
  system system_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .ad1_busy(ad1_busy),
        .ad1_cs(ad1_cs),
        .ad1_data(ad1_data),
        .ad1_range(ad1_range),
        .ad1_rd(ad1_rd),
        .ad2_busy(ad2_busy),
        .ad2_convstab(ad2_convstab),
        .ad2_cs(ad2_cs),
        .ad2_data(ad2_data),
        .ad2_os(ad2_os),
        .ad2_range(ad2_range),
        .ad2_rd(ad2_rd),
        .ad2_reset(ad2_reset),
        .ad_convstab(ad_convstab),
        .ad_os(ad_os),
        .ad_reset(ad_reset),
        .lcd_bl_pwm(lcd_bl_pwm),
        .lcd_iic_scl_i(lcd_iic_scl_i),
        .lcd_iic_scl_o(lcd_iic_scl_o),
        .lcd_iic_scl_t(lcd_iic_scl_t),
        .lcd_iic_sda_i(lcd_iic_sda_i),
        .lcd_iic_sda_o(lcd_iic_sda_o),
        .lcd_iic_sda_t(lcd_iic_sda_t),
        .lcd_int_tri_i(lcd_int_tri_i),
        .relay(relay),
        .vid_active_video(vid_active_video),
        .vid_data(vid_data),
        .vid_hsync(vid_hsync),
        .vid_io_out_clk(vid_io_out_clk),
        .vid_vsync(vid_vsync));
endmodule
