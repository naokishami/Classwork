# BEGIN ASSIGNMENT TAGS
# CWID = 890468754
# NaMe = Naoki Atkins
# Assignment = Mips8DynamicLowercase
# END ASSIGNMENT TAGS

    .data

msg: .space 1025
newline: .asciiz "\n"

    .text

    # Register operands:
    # $s0 - msg
    # $t0 - i
    # $s1 - msg[i]
    # $s2 - byte msg[i]
    # $t1 - test
    # $t2 - test


main:
                li $v0, 8
                la $a0, msg
                syscall
                move $s0, $a0
                li $t0, 0
                li $s3, 90

LoadTest:       add $s1, $s0, $t0       # $s1 = msg[0]
                lb $s2, 0($s1)          # load byte into $s2
                beq $s2, $zero, Exit
                slti $t1, $s2, 65
                bne $t1, $zero, Increment
                slt $t1, $s3, $s2
                bne $t1, $zero, Increment
                j Add

Increment:      addi $t0, $t0, 1        # increment i
                j LoadTest

Add:            addi $s2, $s2, 32       # add 32 to ascii value
                sb $s2 ($s1)            # store byte back into $s1
                j Increment

Exit:           li $v0, 4
                la $a0, msg
                syscall

                li $v0, 4
                la $a0, newline
                syscall

                li $v0, 10
                syscall
