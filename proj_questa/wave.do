onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate {/tb_divider/dut/xd[0]/Di_2_R/clk}
add wave -noupdate -group Initial /tb_divider/dut/srca
add wave -noupdate -group Initial /tb_divider/dut/srcb
add wave -noupdate -group Initial /tb_divider/dut/is_signed
add wave -noupdate -group Initial -radix binary /tb_divider/dut/srca_abs_
add wave -noupdate -group Initial -radix binary /tb_divider/dut/srcb_abs_
add wave -noupdate -group Initial /tb_divider/dut/zeros_
add wave -noupdate -group Initial /tb_divider/dut/Di_
add wave -noupdate -group Initial /tb_divider/dut/di_
add wave -noupdate -expand -group {1 Pipe} {/tb_divider/dut/xd[0]/Di_2_R/in}
add wave -noupdate -expand -group {1 Pipe} {/tb_divider/dut/xd[0]/Di_2_R/out}
add wave -noupdate -expand -group {1 Pipe} {/tb_divider/dut/xd[0]/Qpr/in}
add wave -noupdate -expand -group {1 Pipe} {/tb_divider/dut/xd[0]/Qpr/out}
add wave -noupdate -expand -group {1 Pipe} {/tb_divider/dut/xd[0]/Qnr/in}
add wave -noupdate -expand -group {1 Pipe} {/tb_divider/dut/xd[0]/Qnr/out}
add wave -noupdate -expand -group {2 Pipe} {/tb_divider/dut/xd[1]/Di_2_R/in}
add wave -noupdate -expand -group {2 Pipe} {/tb_divider/dut/xd[1]/Di_2_R/out}
add wave -noupdate -expand -group {2 Pipe} {/tb_divider/dut/xd[1]/Qpr/in}
add wave -noupdate -expand -group {2 Pipe} {/tb_divider/dut/xd[1]/Qpr/out}
add wave -noupdate -expand -group {2 Pipe} {/tb_divider/dut/xd[1]/Qnr/in}
add wave -noupdate -expand -group {2 Pipe} {/tb_divider/dut/xd[1]/Qnr/out}
add wave -noupdate -expand -group {3 Pipe} {/tb_divider/dut/xd[2]/Di_2_R/in}
add wave -noupdate -expand -group {3 Pipe} {/tb_divider/dut/xd[2]/Di_2_R/out}
add wave -noupdate -expand -group {3 Pipe} {/tb_divider/dut/xd[2]/Qpr/in}
add wave -noupdate -expand -group {3 Pipe} {/tb_divider/dut/xd[2]/Qpr/out}
add wave -noupdate -expand -group {3 Pipe} {/tb_divider/dut/xd[2]/Qnr/in}
add wave -noupdate -expand -group {3 Pipe} {/tb_divider/dut/xd[2]/Qnr/out}
add wave -noupdate -expand -group {4 Pipe} {/tb_divider/dut/xd[3]/Di_2_R/in}
add wave -noupdate -expand -group {4 Pipe} {/tb_divider/dut/xd[3]/Di_2_R/out}
add wave -noupdate -expand -group {4 Pipe} {/tb_divider/dut/xd[3]/Qpr/in}
add wave -noupdate -expand -group {4 Pipe} {/tb_divider/dut/xd[3]/Qpr/out}
add wave -noupdate -expand -group {4 Pipe} {/tb_divider/dut/xd[3]/Qnr/in}
add wave -noupdate -expand -group {4 Pipe} {/tb_divider/dut/xd[3]/Qnr/out}
add wave -noupdate -expand -group {5 Pipe} {/tb_divider/dut/xd[4]/Di_2_R/in}
add wave -noupdate -expand -group {5 Pipe} {/tb_divider/dut/xd[4]/Di_2_R/out}
add wave -noupdate -expand -group {5 Pipe} {/tb_divider/dut/xd[4]/Qpr/in}
add wave -noupdate -expand -group {5 Pipe} {/tb_divider/dut/xd[4]/Qpr/out}
add wave -noupdate -expand -group {5 Pipe} {/tb_divider/dut/xd[4]/Qnr/in}
add wave -noupdate -expand -group {5 Pipe} {/tb_divider/dut/xd[4]/Qnr/out}
add wave -noupdate -expand -group {6 Pipe} {/tb_divider/dut/xd[5]/Di_2_R/in}
add wave -noupdate -expand -group {6 Pipe} {/tb_divider/dut/xd[5]/Di_2_R/out}
add wave -noupdate -expand -group {6 Pipe} {/tb_divider/dut/xd[5]/Qpr/in}
add wave -noupdate -expand -group {6 Pipe} {/tb_divider/dut/xd[5]/Qpr/out}
add wave -noupdate -expand -group {6 Pipe} {/tb_divider/dut/xd[5]/Qnr/in}
add wave -noupdate -expand -group {6 Pipe} {/tb_divider/dut/xd[5]/Qnr/out}
add wave -noupdate -expand -group {7 Pipe} {/tb_divider/dut/xd[6]/Di_2_R/in}
add wave -noupdate -expand -group {7 Pipe} {/tb_divider/dut/xd[6]/Di_2_R/out}
add wave -noupdate -expand -group {7 Pipe} {/tb_divider/dut/xd[6]/Qpr/in}
add wave -noupdate -expand -group {7 Pipe} {/tb_divider/dut/xd[6]/Qpr/out}
add wave -noupdate -expand -group {7 Pipe} {/tb_divider/dut/xd[6]/Qnr/in}
add wave -noupdate -expand -group {7 Pipe} {/tb_divider/dut/xd[6]/Qnr/out}
add wave -noupdate -expand -group {8 Pipe} {/tb_divider/dut/xd[7]/Di_2_R/in}
add wave -noupdate -expand -group {8 Pipe} {/tb_divider/dut/xd[7]/Di_2_R/out}
add wave -noupdate -expand -group {8 Pipe} {/tb_divider/dut/xd[7]/Qpr/in}
add wave -noupdate -expand -group {8 Pipe} {/tb_divider/dut/xd[7]/Qpr/out}
add wave -noupdate -expand -group {8 Pipe} {/tb_divider/dut/xd[7]/Qnr/in}
add wave -noupdate -expand -group {8 Pipe} {/tb_divider/dut/xd[7]/Qnr/out}
add wave -noupdate -expand -group {9 Pipe} {/tb_divider/dut/xd[8]/Di_2_R/in}
add wave -noupdate -expand -group {9 Pipe} {/tb_divider/dut/xd[8]/Di_2_R/out}
add wave -noupdate -expand -group {9 Pipe} {/tb_divider/dut/xd[8]/Qpr/in}
add wave -noupdate -expand -group {9 Pipe} {/tb_divider/dut/xd[8]/Qpr/out}
add wave -noupdate -expand -group {9 Pipe} {/tb_divider/dut/xd[8]/Qnr/in}
add wave -noupdate -expand -group {9 Pipe} {/tb_divider/dut/xd[8]/Qnr/out}
add wave -noupdate -expand -group {10 Pipe} {/tb_divider/dut/xd[9]/Di_2_R/in}
add wave -noupdate -expand -group {10 Pipe} {/tb_divider/dut/xd[9]/Di_2_R/out}
add wave -noupdate -expand -group {10 Pipe} {/tb_divider/dut/xd[9]/Qpr/in}
add wave -noupdate -expand -group {10 Pipe} {/tb_divider/dut/xd[9]/Qpr/out}
add wave -noupdate -expand -group {10 Pipe} {/tb_divider/dut/xd[9]/Qnr/in}
add wave -noupdate -expand -group {10 Pipe} {/tb_divider/dut/xd[9]/Qnr/out}
add wave -noupdate -expand -group {11 Pipe} {/tb_divider/dut/xd[10]/Di_2_R/in}
add wave -noupdate -expand -group {11 Pipe} {/tb_divider/dut/xd[10]/Di_2_R/out}
add wave -noupdate -expand -group {11 Pipe} {/tb_divider/dut/xd[10]/Qpr/in}
add wave -noupdate -expand -group {11 Pipe} {/tb_divider/dut/xd[10]/Qpr/out}
add wave -noupdate -expand -group {11 Pipe} {/tb_divider/dut/xd[10]/Qnr/in}
add wave -noupdate -expand -group {11 Pipe} {/tb_divider/dut/xd[10]/Qnr/out}
add wave -noupdate -expand -group {12 Pipe} {/tb_divider/dut/xd[11]/Di_2_R/in}
add wave -noupdate -expand -group {12 Pipe} {/tb_divider/dut/xd[11]/Di_2_R/out}
add wave -noupdate -expand -group {12 Pipe} {/tb_divider/dut/xd[11]/Qpr/in}
add wave -noupdate -expand -group {12 Pipe} {/tb_divider/dut/xd[11]/Qpr/out}
add wave -noupdate -expand -group {12 Pipe} {/tb_divider/dut/xd[11]/Qnr/in}
add wave -noupdate -expand -group {12 Pipe} {/tb_divider/dut/xd[11]/Qnr/out}
add wave -noupdate -expand -group {13 Pipe} {/tb_divider/dut/xd[12]/Di_2_R/in}
add wave -noupdate -expand -group {13 Pipe} {/tb_divider/dut/xd[12]/Di_2_R/out}
add wave -noupdate -expand -group {13 Pipe} {/tb_divider/dut/xd[12]/Qpr/in}
add wave -noupdate -expand -group {13 Pipe} {/tb_divider/dut/xd[12]/Qpr/out}
add wave -noupdate -expand -group {13 Pipe} {/tb_divider/dut/xd[12]/Qnr/in}
add wave -noupdate -expand -group {13 Pipe} {/tb_divider/dut/xd[12]/Qnr/out}
add wave -noupdate -expand -group {14 Pipe} {/tb_divider/dut/xd[13]/Di_2_R/in}
add wave -noupdate -expand -group {14 Pipe} {/tb_divider/dut/xd[13]/Di_2_R/out}
add wave -noupdate -expand -group {14 Pipe} {/tb_divider/dut/xd[13]/Qpr/in}
add wave -noupdate -expand -group {14 Pipe} {/tb_divider/dut/xd[13]/Qpr/out}
add wave -noupdate -expand -group {14 Pipe} {/tb_divider/dut/xd[13]/Qnr/in}
add wave -noupdate -expand -group {14 Pipe} {/tb_divider/dut/xd[13]/Qnr/out}
add wave -noupdate -expand -group {15 Pipe} {/tb_divider/dut/xd[14]/Di_2_R/in}
add wave -noupdate -expand -group {15 Pipe} {/tb_divider/dut/xd[14]/Di_2_R/out}
add wave -noupdate -expand -group {15 Pipe} {/tb_divider/dut/xd[14]/Qpr/in}
add wave -noupdate -expand -group {15 Pipe} {/tb_divider/dut/xd[14]/Qpr/out}
add wave -noupdate -expand -group {15 Pipe} {/tb_divider/dut/xd[14]/Qnr/in}
add wave -noupdate -expand -group {15 Pipe} {/tb_divider/dut/xd[14]/Qnr/out}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {565 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 299
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
WaveRestoreZoom {0 ns} {300 ns}
