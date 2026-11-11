# Name: Huynh Khanh Thien
# Student ID: 26560059
# Class: CSBU102.R11.KHBC
# Purpose: Experiment 1 (TN1) - Load and store variables in main memory (varA = varB + varC)
# Register plan:
# $t0: base address of varB
# $t1: value of varB (loaded from memory)
# $t2: value of varC (loaded from memory)
# $t3: sum of varB and varC (stored back to varA in memory)

.data
varB: .word 25
varC: .word 17
varA: .word 0 
 
.text
.globl main
main:
    la   $t0, varB        # $t0 = address of varB
    lw   $t1, 0($t0)      # $t1 = varB
    lw   $t2, 4($t0)      # $t2 = varC
    add  $t3, $t1, $t2    # $t3 = varB + varC
    sw   $t3, 8($t0)      # varA = $t3
    li   $v0, 10          # exit
    syscall
