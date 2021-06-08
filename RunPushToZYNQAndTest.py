#!/usr/bin/env python3 

import os

PYNQHOST="xilinx@192.168.1.128"
PYNQROOTHOST="root@192.168.1.128"
PYNQDIR="/home/xilinx/SubtractBranchNegative"
PYNQSCPTARGET=PYNQHOST+":"+PYNQDIR

def Run(command):
  print("Running: "+command)
  os.system(command)

#
# Copy all files to ZYNQ 
#

Run("ssh "+PYNQHOST + " rm "+PYNQDIR+"/*")
Run("ssh "+PYNQHOST + " mkdir "+PYNQDIR)
Run("scp ./FPGAImage/FPGAImage.runs/impl_1/design_1_wrapper.bit "+                 PYNQSCPTARGET+"/SubtractBranchNegative.bit")
Run("scp ./FPGAImage/FPGAImage.gen/sources_1/bd/design_1/hw_handoff/design_1.hwh "+PYNQSCPTARGET+"/SubtractBranchNegative.hwh")
Run("scp ./python/RunSBNOverlay.py ./python/ZYNQRunSBNRegression.sh ./testcases/testAssembled/* ./testcases/testResults/* "+PYNQSCPTARGET)

Run("ssh "+PYNQROOTHOST + ' ' + PYNQDIR +"/ZYNQRunSBNRegression.sh" )
