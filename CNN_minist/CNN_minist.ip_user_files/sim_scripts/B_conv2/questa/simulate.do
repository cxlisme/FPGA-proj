onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib B_conv2_opt

do {wave.do}

view wave
view structure
view signals

do {B_conv2.udo}

run -all

quit -force
