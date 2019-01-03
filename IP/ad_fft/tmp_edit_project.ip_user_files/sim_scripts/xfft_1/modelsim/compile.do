vlib work
vlib msim

vlib msim/xbip_utils_v3_0_5
vlib msim/axi_utils_v2_0_1
vlib msim/c_reg_fd_v12_0_1
vlib msim/xbip_dsp48_wrapper_v3_0_4
vlib msim/xbip_pipe_v3_0_1
vlib msim/xbip_dsp48_addsub_v3_0_1
vlib msim/xbip_addsub_v3_0_1
vlib msim/c_addsub_v12_0_8
vlib msim/c_mux_bit_v12_0_1
vlib msim/c_shift_ram_v12_0_8
vlib msim/xbip_bram18k_v3_0_1
vlib msim/mult_gen_v12_0_10
vlib msim/cmpy_v6_0_10
vlib msim/floating_point_v7_0_11
vlib msim/xfft_v9_0_9
vlib msim/xil_defaultlib

vmap xbip_utils_v3_0_5 msim/xbip_utils_v3_0_5
vmap axi_utils_v2_0_1 msim/axi_utils_v2_0_1
vmap c_reg_fd_v12_0_1 msim/c_reg_fd_v12_0_1
vmap xbip_dsp48_wrapper_v3_0_4 msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_1 msim/xbip_pipe_v3_0_1
vmap xbip_dsp48_addsub_v3_0_1 msim/xbip_dsp48_addsub_v3_0_1
vmap xbip_addsub_v3_0_1 msim/xbip_addsub_v3_0_1
vmap c_addsub_v12_0_8 msim/c_addsub_v12_0_8
vmap c_mux_bit_v12_0_1 msim/c_mux_bit_v12_0_1
vmap c_shift_ram_v12_0_8 msim/c_shift_ram_v12_0_8
vmap xbip_bram18k_v3_0_1 msim/xbip_bram18k_v3_0_1
vmap mult_gen_v12_0_10 msim/mult_gen_v12_0_10
vmap cmpy_v6_0_10 msim/cmpy_v6_0_10
vmap floating_point_v7_0_11 msim/floating_point_v7_0_11
vmap xfft_v9_0_9 msim/xfft_v9_0_9
vmap xil_defaultlib msim/xil_defaultlib

vcom -work xbip_utils_v3_0_5 -64 -93 \
"../../../ipstatic/xbip_utils_v3_0_5/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_1 -64 -93 \
"../../../ipstatic/axi_utils_v2_0_1/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_1 -64 -93 \
"../../../ipstatic/c_reg_fd_v12_0_1/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_reg_fd_v12_0_1/hdl/c_reg_fd_v12_0.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -64 -93 \
"../../../ipstatic/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_1 -64 -93 \
"../../../ipstatic/xbip_pipe_v3_0_1/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_pipe_v3_0_1/hdl/xbip_pipe_v3_0.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_1 -64 -93 \
"../../../ipstatic/xbip_dsp48_addsub_v3_0_1/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_dsp48_addsub_v3_0_1/hdl/xbip_dsp48_addsub_v3_0.vhd" \

vcom -work xbip_addsub_v3_0_1 -64 -93 \
"../../../ipstatic/xbip_addsub_v3_0_1/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_addsub_v3_0_1/hdl/xbip_addsub_v3_0.vhd" \

vcom -work c_addsub_v12_0_8 -64 -93 \
"../../../ipstatic/c_addsub_v12_0_8/hdl/c_addsub_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_addsub_v12_0_8/hdl/c_addsub_v12_0.vhd" \

vcom -work c_mux_bit_v12_0_1 -64 -93 \
"../../../ipstatic/c_mux_bit_v12_0_1/hdl/c_mux_bit_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_mux_bit_v12_0_1/hdl/c_mux_bit_v12_0.vhd" \

vcom -work c_shift_ram_v12_0_8 -64 -93 \
"../../../ipstatic/c_shift_ram_v12_0_8/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_shift_ram_v12_0_8/hdl/c_shift_ram_v12_0.vhd" \

vcom -work xbip_bram18k_v3_0_1 -64 -93 \
"../../../ipstatic/xbip_bram18k_v3_0_1/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_bram18k_v3_0_1/hdl/xbip_bram18k_v3_0.vhd" \

vcom -work mult_gen_v12_0_10 -64 -93 \
"../../../ipstatic/mult_gen_v12_0_10/hdl/mult_gen_v12_0_vh_rfs.vhd" \
"../../../ipstatic/mult_gen_v12_0_10/hdl/mult_gen_v12_0.vhd" \

vcom -work cmpy_v6_0_10 -64 -93 \
"../../../ipstatic/cmpy_v6_0_10/hdl/cmpy_v6_0_vh_rfs.vhd" \
"../../../ipstatic/cmpy_v6_0_10/hdl/cmpy_v6_0.vhd" \

vcom -work floating_point_v7_0_11 -64 -93 \
"../../../ipstatic/floating_point_v7_0_11/hdl/floating_point_v7_0_vh_rfs.vhd" \

vcom -work xfft_v9_0_9 -64 -93 \
"../../../ipstatic/xfft_v9_0_9/hdl/xfft_v9_0_vh_rfs.vhd" \
"../../../ipstatic/xfft_v9_0_9/hdl/xfft_v9_0.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../src/xfft_1/sim/xfft_1.vhd" \

