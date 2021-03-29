# BEGIN ASSIGNMENT TAGS
# CWID = 890468754
# NaMe = Naoki Atkins
# Assignment = Mips5Branching
# END ASSIGNMENT TAGS

      .data

newline: .asciiz "\n"

      .text

main:

Load:       li $v0, 5
            syscall
            move $t0, $v0

Test:       beq $t0, $zero, Exit

Print:      li $v0, 1
            move $a0, $t0
            syscall
            li $v0, 4
            la $a0, newline
            syscall
            j Load

Exit:       li $v0, 10
            syscall
