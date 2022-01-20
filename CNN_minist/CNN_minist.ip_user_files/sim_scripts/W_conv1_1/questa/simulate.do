onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib W_conv1_opt

do {wave.do}

view wave
view structure
view signals

do {W_conv1.udo}

run -all

quit -force
