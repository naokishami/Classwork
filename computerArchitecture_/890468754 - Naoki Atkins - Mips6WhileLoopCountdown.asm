# BEGIN ASSIGNMENT TAGS
# CWID = 890468754
# NaMe = Naoki Atkins
# Assignment = Mips6WhileLoopCountdown
# END ASSIGNMENT TAGS

    .data

newline: .asciiz "\n"

    .text
main:
Load:   li $v0, 5
        syscall
        move $t0, $v0

Test:   slti $t1, $t0, 1          # $t1 = 1 if $t0 < 1
        beq $t1, $zero, While     # if $t1 = 0, branch to While label
        bne $t1, $zero, Exit

While:  li $v0, 1
        move $a0, $t0
        syscall
        li $v0, 4
        la $a0, newline
        syscall
        addi $t0, $t0, -1
        j Test

Exit:   li $v0, 10
        syscall
