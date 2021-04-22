# BEGIN ASSIGNMENT TAGS
# CWID = 890468754
# NaMe = Naoki Atkins
# Assignment = Mips9Average
# END ASSIGNMENT TAGS

    .data

newline: .asciiz "\n"

    .text

main:
    li $t0, 0
    li $t3, 0
    li $t4, 0

    li $v0, 5
    syscall
    move $t2, $v0

calc_loop:
    bge $t0, $t2, calc_exit
    li $v0, 5
    syscall

    add $t3, $t3, $v0
    addi $t0, $t0, 1
    j calc_loop

calc_exit:
    move $a0, $t3
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    mtc1.d $t3, $f0
    cvt.d.w $f0, $f0
    mtc1.d $t2, $f2
    cvt.d.w $f2, $f2
    div.d $f12, $f0, $f2
    li $v0, 3
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    j Exit

Exit:
    li $v0, 10
    syscall
