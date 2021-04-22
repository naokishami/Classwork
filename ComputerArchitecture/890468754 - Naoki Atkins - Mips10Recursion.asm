# BEGIN ASSIGNMENT TAGS
# CWID = 890468754
# NaMe = Naoki Atkins
# Assignment = Mips10Recursion
# END ASSIGNMENT TAGS

    .data

newline: .asciiz "\n"

    .text

    # register usage
    # $s0 - user input - any integer - N
    # $s1 - counter - starts from zero
    # $t1 - holds value of $a0 after call to function in loop

main:
    li $v0, 5
    syscall

    move $s0, $v0               # user input
    add $s1, $s1, $zero         # counter


loop:
    move $a0, $s1               # about to pass $a0 to function

    sub $sp, $sp, 4
    sw $a0, 0($sp)              # store $a0
    jal function
    lw $t1, 0($sp)              # restore $a0 into $t1
    addi $sp, $sp, 4

    move $a0, $v0               # load retval of function

    li $v0, 1
    syscall                     # print retval

    addi $s1, $t1, 1            # increment counter

    li $v0, 4
    la $a0, newline
    syscall

    bne $s1, $s0, loop          # test to see if we're at end of loop
    j Exit

function:
    bgt $a0, 1, functionRecurse # test to see if we recurse if N > 1
    move $v0, $a0               # otherwise load retval into $v0
    jr $ra

functionRecurse:
    sub $sp, $sp, 12
    sw $ra, 0($sp)              # store $ra
    sw $a0, 4($sp)              # store $a0

    addi $a0, $a0, -1           # decrement $a0 or N

    jal function
    lw $a0, 4($sp)              # restore $a0 or N
    sw $v0, 8($sp)              # store retval from function because this will get overwritten
                                # in the next call to function

    addi $a0, $a0, -2           # decrement $a0 or N by 2

    jal function
    lw $t0, 8($sp)              # store retval into $t0

    add $v0, $t0, $v0           # add both values

    lw $ra, 0($sp)
    addi $sp, $sp, 12
    jr $ra

Exit:
    li $v0, 10
    syscall
