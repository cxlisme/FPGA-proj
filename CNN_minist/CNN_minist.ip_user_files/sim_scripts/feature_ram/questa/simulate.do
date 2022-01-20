onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib feature_ram_opt

do {wave.do}

view wave
view structure
view signals

do {feature_ram.udo}

run -all

quit -force
