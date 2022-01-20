onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+B_conv2 -L xil_defaultlib -L xpm -L blk_mem_gen_v8_4_2 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.B_conv2 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {B_conv2.udo}

run -all

endsim

quit -force
