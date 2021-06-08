#!/bin/sh 
#
# RUN ON ZYNQ-- runs all testcases to make sure nothing has broken 
#

set -e 

cd /home/xilinx/SubtractBranchNegative
./RunSBNOverlay.py Multiply4And3.sbn.json Multiply4And3.result.json
./RunSBNOverlay.py Divide300By7.sbn.json  Divide300By7.result.json

