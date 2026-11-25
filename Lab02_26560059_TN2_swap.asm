# Name: Huynh Khanh Thien
# Student ID: 26560059
# Purpose: Experiment 2 - Swap scores[0] and scores[4] in memory

.data
scores: .word 40, 55, 70, 85, 100

.text
.globl main
main:
    la   $s0, scores
    lw   $t0, 0($s0)
    lw   $t1, 16($s0)
    sw   $t1, 0($s0)
    sw   $t0, 16($s0)
    li   $v0, 10
    syscall
