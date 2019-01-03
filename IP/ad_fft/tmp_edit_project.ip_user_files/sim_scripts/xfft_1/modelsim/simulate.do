onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L secureip -L xbip_utils_v3_0_5 -L axi_utils_v2_0_1 -L c_reg_fd_v12_0_1 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_1 -L xbip_dsp48_addsub_v3_0_1 -L xbip_addsub_v3_0_1 -L c_addsub_v12_0_8 -L c_mux_bit_v12_0_1 -L c_shift_ram_v12_0_8 -L xbip_bram18k_v3_0_1 -L mult_gen_v12_0_10 -L cmpy_v6_0_10 -L floating_point_v7_0_11 -L xfft_v9_0_9 -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.xfft_1

do {wave.do}

view wave
view structure
view signals

do {xfft_1.udo}

run -all

quit -force