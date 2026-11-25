# Name: Huynh Khanh Thien
# Student ID: 26560059
# Purpose: Experiment 3 - Capitalize letters at offsets 0, 7, 11 of a string

.data
str1: .asciiz "nguyen van an"
tag:  .asciiz " [end]"
nl:   .asciiz "\n"

.text
.globl main
main:
    la   $s0, str1

    lb   $t0, 0($s0)
    addi $t0, $t0, -32
    sb   $t0, 0($s0)

    lb   $t0, 7($s0)
    addi $t0, $t0, -32
    sb   $t0, 7($s0)

    lb   $t0, 11($s0)
    addi $t0, $t0, -32
    sb   $t0, 11($s0)

    li   $v0, 4
    add  $a0, $s0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    li   $v0, 10
    syscall
