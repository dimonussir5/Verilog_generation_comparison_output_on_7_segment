onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /FSM_tb/clk
add wave -noupdate /FSM_tb/rst_ni
add wave -noupdate /FSM_tb/ENA
add wave -noupdate -expand -group calc /FSM_tb/sel
add wave -noupdate -expand -group calc /FSM_tb/digi
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ns} {584 ns}
