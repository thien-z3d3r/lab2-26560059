# Name: Huynh Khanh Thien
# Student ID: 26560059
# Purpose: Experiment 2 - Update scores[4] = 98 and calculate total

.data
scores:  .word 40, 55, 70, 85, 100
msg_tot: .asciiz "Total:  "
nl:      .asciiz "\n"

.text
.globl main
main:
    la   $s0, scores
    addi $s1, $zero, 4
    addi $s2, $zero, 98
    sll  $t1, $s1, 2
    add  $t1, $t1, $s0
    sw   $s2, 0($t1)

    lw   $t0, 0($s0)
    add  $s3, $zero, $t0
    lw   $t0, 4($s0)
    add  $s3, $s3, $t0
    lw   $t0, 8($s0)
    add  $s3, $s3, $t0
    lw   $t0, 12($s0)
    add  $s3, $s3, $t0
    lw   $t0, 16($s0)
    add  $s3, $s3, $t0

    li   $v0, 4
    la   $a0, msg_tot
    syscall
    li   $v0, 1
    add  $a0, $s3, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    li   $v0, 10
    syscall
