# Name: Huynh Khanh Thien
# Student ID: 26560059
# Class: CSBU102.R11.KHBC
# Purpose: Extension (EXT) - Represent a 3x3 board in memory as 9 words and place marks
# Register plan:
# $s0: base address of board
# $s1: row r
# $s2: column c
# $t0: computed effective address board + 4 * (3 * r + c)
# $t1: temporary calculation register
# $t3: mark value to store (1 for X, 2 for O)

.data
board: .word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
main:
    la   $s0, board           # $s0 = base address of board

    addi $s1, $zero, 1        # r = 1
    addi $s2, $zero, 2        # c = 2
    addi $t3, $zero, 1        # mark = 1


    sll  $t1, $s1, 1          # $t1 = 2 * r
    add  $t1, $t1, $s1        # $t1 = 3 * r
    # add column c: word index = 3 * r + c
    add  $t1, $t1, $s2        # $t1 = 3 * r + c
    # byte offset = 4 * (3 * r + c)
    sll  $t1, $t1, 2          # $t1 = 4 * (3 * r + c)
    # effective address = board + byte offset
    add  $t0, $s0, $t1        # $t0 = address of board[r][c]
    sw   $t3, 0($t0)          # board[1][2] = 1


    addi $s1, $zero, 2        # r = 2
    addi $s2, $zero, 0        # c = 0
    addi $t3, $zero, 2        # mark = 2


    sll  $t1, $s1, 1          # $t1 = 2 * r
    add  $t1, $t1, $s1        # $t1 = 3 * r
    add  $t1, $t1, $s2        # $t1 = 3 * r + c
    # byte offset = 4 * (3 * r + c)
    sll  $t1, $t1, 2          # $t1 = 4 * (3 * r + c)
    add  $t0, $s0, $t1        # $t0 = address of board[r][c]
    sw   $t3, 0($t0)          # board[2][0] = 2

    li   $v0, 10              # exit
    syscall
