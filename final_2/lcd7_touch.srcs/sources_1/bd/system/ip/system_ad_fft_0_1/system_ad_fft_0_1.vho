-- (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:user:ad_fft:1.0
-- IP Revision: 1

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT system_ad_fft_0_1
  PORT (
    clk : IN STD_LOGIC;
    ad1_data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    ad1_busy : IN STD_LOGIC;
    ad1_cs : OUT STD_LOGIC;
    ad1_rd : OUT STD_LOGIC;
    ad_reset : OUT STD_LOGIC;
    ad_convstab : OUT STD_LOGIC;
    ad_os : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    ad2_data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    ad2_busy : IN STD_LOGIC;
    ad2_cs : OUT STD_LOGIC;
    ad2_rd : OUT STD_LOGIC;
    ad2_reset : OUT STD_LOGIC;
    ad2_convstab : OUT STD_LOGIC;
    ad2_os : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    ad1_range : OUT STD_LOGIC;
    ad2_range : OUT STD_LOGIC;
    fft_reset : IN STD_LOGIC;
    fft_data : OUT STD_LOGIC_VECTOR(895 DOWNTO 0);
    done : OUT STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : system_ad_fft_0_1
  PORT MAP (
    clk => clk,
    ad1_data => ad1_data,
    ad1_busy => ad1_busy,
    ad1_cs => ad1_cs,
    ad1_rd => ad1_rd,
    ad_reset => ad_reset,
    ad_convstab => ad_convstab,
    ad_os => ad_os,
    ad2_data => ad2_data,
    ad2_busy => ad2_busy,
    ad2_cs => ad2_cs,
    ad2_rd => ad2_rd,
    ad2_reset => ad2_reset,
    ad2_convstab => ad2_convstab,
    ad2_os => ad2_os,
    ad1_range => ad1_range,
    ad2_range => ad2_range,
    fft_reset => fft_reset,
    fft_data => fft_data,
    done => done
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file system_ad_fft_0_1.vhd when simulating
-- the core, system_ad_fft_0_1. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.

