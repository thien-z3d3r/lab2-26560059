# Name: Huynh Khanh Thien
# Student ID: 26560059
# Purpose: Extension - Represent a 3x3 board in memory and place marks

.data
board: .word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
main:
    la   $s0, board

    addi $s1, $zero, 1
    addi $s2, $zero, 2
    addi $t3, $zero, 1
    sll  $t1, $s1, 1
    add  $t1, $t1, $s1
    add  $t1, $t1, $s2
    sll  $t1, $t1, 2
    add  $t0, $s0, $t1
    sw   $t3, 0($t0)

    addi $s1, $zero, 2
    addi $s2, $zero, 0
    addi $t3, $zero, 2
    sll  $t1, $s1, 1
    add  $t1, $t1, $s1
    add  $t1, $t1, $s2
    sll  $t1, $t1, 2
    add  $t0, $s0, $t1
    sw   $t3, 0($t0)

    li   $v0, 10
    syscall
