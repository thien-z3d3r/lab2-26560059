# Name: Huynh Khanh Thien
# Student ID: 26560059
# Class: CSBU102.R11.KHBC
# Purpose: Experiment 2 (Step 2.1) - Swap scores[0] and scores[4] in memory
# Register plan:
# $s0: base address of scores array
# $t0: temporary register holding original scores[0]
# $t1: temporary register holding original scores[4]

.data
scores: .word 40, 55, 70, 85, 100

.text
.globl main
main:
    la   $s0, scores          # $s0 = address of scores[0]
    lw   $t0, 0($s0)          # load scores[0] into $t0
    lw   $t1, 16($s0)         # load scores[4] into $t1
    sw   $t1, 0($s0)          # store $t1 into scores[0]
    sw   $t0, 16($s0)         # store $t0 into scores[4]

    li   $v0, 10              # exit
    syscall
