onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib W_fc2_opt

do {wave.do}

view wave
view structure
view signals

do {W_fc2.udo}

run -all

quit -force
