onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_CR_1/CLK
add wave -noupdate /tb_CR_1/ENraf
add wave -noupdate /tb_CR_1/ENgen
add wave -noupdate /tb_CR_1/ENwrk
add wave -noupdate /tb_CR_1/RST
add wave -noupdate /tb_CR_1/CR_1_inst/full
add wave -noupdate -radix binary -radixshowbase 0 /tb_CR_1/ss
add wave -noupdate /tb_CR_1/dig
add wave -noupdate -radix unsigned /tb_CR_1/usedw
add wave -noupdate -radix unsigned /tb_CR_1/CR_1_inst/data
add wave -noupdate /tb_CR_1/CR_1_inst/empty
add wave -noupdate -radix unsigned /tb_CR_1/CR_1_inst/q
add wave -noupdate -radix unsigned /tb_CR_1/CR_1_inst/bc
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {713662 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 283
configure wave -valuecolwidth 39
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {531863 ps} {1108117 ps}
