onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib picture_784_opt

do {wave.do}

view wave
view structure
view signals

do {picture_784.udo}

run -all

quit -force
