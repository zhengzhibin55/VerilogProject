# 
# Synthesis run script generated by Vivado
# 

set_param simulator.modelsimInstallPath C:/modeltech64_10.1c/win64
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z020clg400-2

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/FPGA/V_project/IP/w_ram/tmp_edit_project.cache/wt [current_project]
set_property parent.project_path D:/FPGA/V_project/IP/w_ram/tmp_edit_project.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_verilog -library xil_defaultlib D:/FPGA/V_project/IP/w_ram/src/w_ram.v
synth_design -top w_ram -part xc7z020clg400-2
write_checkpoint -noxdef w_ram.dcp
catch { report_utilization -file w_ram_utilization_synth.rpt -pb w_ram_utilization_synth.pb }
