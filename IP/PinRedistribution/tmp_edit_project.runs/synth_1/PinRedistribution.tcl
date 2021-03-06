# 
# Synthesis run script generated by Vivado
# 

set_param simulator.modelsimInstallPath C:/modeltech64_10.1c/win64
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {HDL-1065} -limit 10000
create_project -in_memory -part xc7z020clg400-2

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir d:/fpga/v_project/ip/pinredistribution/tmp_edit_project.cache/wt [current_project]
set_property parent.project_path d:/fpga/v_project/ip/pinredistribution/tmp_edit_project.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_verilog -library xil_defaultlib d:/fpga/v_project/ip/pinredistribution/src/PinRedistribution.v
synth_design -top PinRedistribution -part xc7z020clg400-2
write_checkpoint -noxdef PinRedistribution.dcp
catch { report_utilization -file PinRedistribution_utilization_synth.rpt -pb PinRedistribution_utilization_synth.pb }
