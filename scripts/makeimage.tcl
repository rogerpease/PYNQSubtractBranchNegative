#-----------------------------------------------------------
# Vivado v2020.2 (64-bit)
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
# IP Build 3064653 on Wed Nov 18 14:17:31 MST 2020
# Start of session at: Thu May  6 14:55:26 2021
# Process ID: 130133
# Current directory: /home/rpease/PYNQProjects/SubtractBranchNegative
# Command line: vivado
# Log file: /home/rpease/PYNQProjects/SubtractBranchNegative/vivado.log
# Journal file: /home/rpease/PYNQProjects/SubtractBranchNegative/vivado.jou
#-----------------------------------------------------------
create_project FPGAImage ./FPGAImage -part xc7z020clg400-1
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
create_bd_design "design_1"
update_compile_order -fileset sources_1
set_property  ip_repo_paths  ./Verilog/module [current_project]
update_ip_catalog
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup
startgroup
create_bd_cell -type ip -vlnv rogerpease.com:rogerpease:SBNModule:1.0 SBNModule_0
endgroup
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/SBNModule_0/sbndatapath} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins SBNModule_0/sbndatapath]
make_wrapper -files [get_files ./FPGAImage/FPGAImage.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse ./FPGAImage/FPGAImage.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v
launch_runs impl_1 -to_step write_bitstream -jobs 2
wait_on_run impl_1
open_run impl_1
