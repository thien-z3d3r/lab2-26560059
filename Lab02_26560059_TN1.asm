# Name: Huynh Khanh Thien
# Student ID: 26560059
# Purpose: Experiment 1 - Load and store variables in main memory (varA = varB + varC)

.data
varB: .word 25
varC: .word 17
varA: .word 0

.text
.globl main
main:
    la   $t0, varB
    lw   $t1, 0($t0)
    lw   $t2, 4($t0)
    add  $t3, $t1, $t2
    sw   $t3, 8($t0)
    li   $v0, 10
    syscall
