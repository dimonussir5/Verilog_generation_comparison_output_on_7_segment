onerror {resume}
quietly set dataset_list [list sim vsim]
if {[catch {datasetcheck $dataset_list}]} {abort}
quietly WaveActivateNextPane {} 0
add wave -noupdate sim:/MUX_tb/A
add wave -noupdate sim:/MUX_tb/B
add wave -noupdate sim:/MUX_tb/C
add wave -noupdate sim:/MUX_tb/D
add wave -noupdate sim:/MUX_tb/sel
add wave -noupdate sim:/MUX_tb/res
add wave -noupdate sim:/MUX_tb/expected
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
configure wave -namecolwidth 150
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {522 ns}
