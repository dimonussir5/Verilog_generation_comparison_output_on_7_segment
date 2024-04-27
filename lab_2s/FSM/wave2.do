onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MUX_tb/clk
add wave -noupdate /MUX_tb/sel
add wave -noupdate -expand -group data /MUX_tb/A
add wave -noupdate -expand -group data /MUX_tb/B
add wave -noupdate -expand -group data /MUX_tb/C
add wave -noupdate -expand -group data /MUX_tb/D
add wave -noupdate /MUX_tb/res
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
configure wave -namecolwidth 131
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
WaveRestoreZoom {0 ns} {554 ns}
