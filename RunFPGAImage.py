#!/usr/bin/env python3 

#
# NOTE: This script is my own, but most of the verilog code is from auto-generated from an AXI Peripheral TB which I adapted to my needs. 
# NOTE: Normally I'd do this with a makefile or an organized flow but this is more for notes/education purposes so drawing out the steps makes more sense. 
#
#
import os
import subprocess

os.environ["LD_LIBRARY_PATH"] ="/tools/Xilinx/.xinstall/Vivado_2020.2/lib/lnx64.o:/tools/Xilinx/Vivado/2020.2/lib/lnx64.o:/tools/Xilinx/.xinstall/Vivado_2020.2/lib/lnx64.o/SuSE/"

VIVADO_BIN="/tools/Xilinx/Vivado/2020.2/bin"

if not os.path.exists("scripts/makeimage.tcl"):
  print ("scripts/makeimage.tcl not found");
  exit(1) 


def Run(commandString):
  print("Running: "," ".join(commandString))
  result = subprocess.Popen(commandString)
  text = result.communicate()[0]
  return_code = result.returncode
  print("Returning ",return_code)
  if (return_code != 0):
    exit(1)


Run(["rm","-rf","FPGAImage","project_1"]) 
Run(["mkdir","FPGAImage"]) 
Run([VIVADO_BIN+"/vivado","-mode","batch","-source","scripts/makeimage.tcl"]) 

