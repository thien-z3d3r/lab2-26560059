# Name: Huynh Khanh Thien
# Student ID: 26560059
# Class: CSBU102.R11.KHBC
# Purpose: Experiment 2 (TN2 - Step 2.3) - Update scores[k] with personal data and calculate total
# Personal data: Student ID ends with D = 9 -> index k = 4, new score V = 98
# Register plan:
# $s0: base address of scores array
# $s1: index k (4)
# $s2: new score value V (98)
# $s3: total sum of scores
# $t0: temporary register for loading elements
# $t1: computed effective address of scores[k]

.data
scores:  .word 40, 55, 70, 85, 100
msg_tot: .asciiz "Total:  "
nl:      .asciiz "\n"

.text
.globl main
main:
    la   $s0, scores          # $s0 = address of scores[0]

    # (1) Put k in $s1 and V in $s2, compute address and store V into scores[k]
    addi $s1, $zero, 4        # k = 4 (for D = 9)
    addi $s2, $zero, 98       # V = 98 (for D = 9)
    sll  $t1, $s1, 2          # $t1 = 4 * k
    add  $t1, $t1, $s0        # $t1 = address of scores[k]
    sw   $s2, 0($t1)          # scores[k] = V

    # (2) Sum up the five scores in $s3 using lw and constant offsets
    lw   $t0, 0($s0)          # load scores[0]
    add  $s3, $zero, $t0      # $s3 = scores[0]

    lw   $t0, 4($s0)          # load scores[1]
    add  $s3, $s3, $t0        # $s3 += scores[1]

    lw   $t0, 8($s0)          # load scores[2]
    add  $s3, $s3, $t0        # $s3 += scores[2]

    lw   $t0, 12($s0)         # load scores[3]
    add  $s3, $s3, $t0        # $s3 += scores[3]

    lw   $t0, 16($s0)         # load scores[4]
    add  $s3, $s3, $t0        # $s3 += scores[4]

    # (3) Print "Total:  " followed by total and newline
    li   $v0, 4
    la   $a0, msg_tot
    syscall

    li   $v0, 1
    add  $a0, $s3, $zero
    syscall

    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10              # exit
    syscall
