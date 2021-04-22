# BEGIN ASSIGNMENT TAGS
# CWID = 890468754
# NaMe = Naoki Atkins
# Assignment = Mips1Awesome
# END ASSIGNMENT TAGS

    .data

msg: .asciiz "These MIPS assignments are going to be awesome!"
newline: .asciiz "\n"
num: .double 1.1


    .text

main:
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 1
    li $a0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    # print double float
    l.d $f12, num
    li $v0, 3
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall
