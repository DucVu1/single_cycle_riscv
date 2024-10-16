onerror {quit -f}
vlib work
vlog -work work Single_Cycle.vo
vlog -work work Single_Cycle.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Single_Cycle_vlg_vec_tst
vcd file -direction Single_Cycle.msim.vcd
vcd add -internal Single_Cycle_vlg_vec_tst/*
vcd add -internal Single_Cycle_vlg_vec_tst/i1/*
add wave /*
run -all
