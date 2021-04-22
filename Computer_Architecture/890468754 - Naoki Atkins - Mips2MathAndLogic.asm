# BEGIN ASSIGNMENT TAGS
# CWID = 890468754
# NaMe = Naoki Atkins
# Assignment = Mips2MathAndLogic
# END ASSIGNMENT TAGS

    .data

newline: .asciiz "\n"

    .text

main:

    li $v0, 5
    syscall
    move $s0, $v0

    li $v0, 5
    syscall
    move $s1, $v0

    li $v0, 1               # perform addition
    add $a0, $s0, $s1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 1               # perform subtraction
    sub $a0, $s0, $s1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 1               # perform logical or
    or $a0, $s0, $s1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 1               # perform logical and
    and $a0, $s0, $s1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall
