# Name: Huynh Khanh Thien
# Student ID: 26560059
# Class: CSBU102.R11.KHBC
# Purpose: Experiment 3 (TN3 - Step 3.4) - Capitalize letters at offsets 0, 7, 11 of a string
# Register plan:
# $s0: base address of str1
# $t0: temporary register holding loaded character byte

.data
str1: .asciiz "nguyen van an"
tag:  .asciiz " [end]"
nl:   .asciiz "\n"

.text
.globl main
main:
    la   $s0, str1            # $s0 = address of str1

    # make the byte at offset 0 a capital letter ('n' -> 'N')
    lb   $t0, 0($s0)
    addi $t0, $t0, -32
    sb   $t0, 0($s0)

    # make the byte at offset 7 a capital letter ('v' -> 'V')
    lb   $t0, 7($s0)
    addi $t0, $t0, -32
    sb   $t0, 7($s0)

    # make the byte at offset 11 a capital letter ('a' -> 'A')
    lb   $t0, 11($s0)
    addi $t0, $t0, -32
    sb   $t0, 11($s0)

    li   $v0, 4               # service 4: print string
    add  $a0, $s0, $zero
    syscall

    li   $v0, 4               # newline
    la   $a0, nl
    syscall

    li   $v0, 10              # exit
    syscall
