rm TestSBNDatapath
rm -rf obj_dir
verilator --cc --exe --trace --build -j TestSBN.cpp ../Verilog/module/SBNDatapath.v --dump-defines -o TestSBNDatapath
./obj_dir/TestSBNDatapath
