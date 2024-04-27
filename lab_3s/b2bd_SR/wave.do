onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /b2bd_ROM_tb/bc
add wave -noupdate /b2bd_ROM_tb/clk
add wave -noupdate -radix hexadecimal /b2bd_ROM_tb/expected
add wave -noupdate -radix hexadecimal /b2bd_ROM_tb/bdc_sr
add wave -noupdate -radix hexadecimal /b2bd_ROM_tb/bdc_log
add wave -noupdate -radix hexadecimal /b2bd_ROM_tb/bdc_rom
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 178
configure wave -valuecolwidth 49
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
WaveRestoreZoom {0 ns} {1398 ns}
