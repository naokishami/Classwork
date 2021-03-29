# BEGIN ASSIGNMENT TAGS
# CWID = 890468754
# NaMe = Naoki Atkins
# Assignment = Mips3BitwiseShift 
# END ASSIGNMENT TAGS

.data

  newline: .asciiz "\n"
  int1: .word 1

.text

main:

  # Load first integer
  li $v0, 5
  syscall
  move $s0, $v0

  # Load second integer
  li $v0, 5
  syscall
  move $s1, $v0

  # $1 shifted left by $2 bits
  sll $t0, $s0, $s1
  li $v0, 1
  move $a0, $t0
  syscall

  # Print newline
	li $v0, 4
	la $a0, newline
	syscall

  # Load int1 into $s2
  lw $s2, int1
  move $a0, $s2

  # $1 shifted left by $H bits
  sll $t1, $s0, $s2
  li $v0, 1
  move $a0, $t1
  syscall

  # Print newline
  li $v0, 4
  la $a0, newline
  syscall

  # $1 shifted right by $2 bits
  srl $t0, $s0, $s1
  li $v0, 1
  move $a0, $t0
  syscall

  # Print newline
  li $v0, 4
  la $a0, newline
  syscall

  # $1 shifted right by $H bits
  srl $t1, $s0, $s2
  li $v0, 1
  move $a0, $t1
  syscall

  # Print newline
	li $v0, 4
	la $a0, newline
	syscall

  # Exit properly
  li $v0, 10
  syscall
