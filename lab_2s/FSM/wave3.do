onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lab_2s_tb/clk
add wave -noupdate /lab_2s_tb/rst_n
add wave -noupdate -expand /lab_2s_tb/dig
add wave -noupdate -expand /lab_2s_tb/ss
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
configure wave -namecolwidth 125
configure wave -valuecolwidth 40
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
WaveRestoreZoom {1181 ns} {2559 ns}
