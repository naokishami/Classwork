# BEGIN ASSIGNMENT TAGS
# CWID = 890468754
# NaMe = Naoki Atkins
# Assignment = Mips4IntegerToDouble
# END ASSIGNMENT TAGS

# If the loaded integer is 5
# Then the output result should be 6.5

.data

newline: .asciiz "\n"
dub: .double 1.3

.text


main:

  # Load double into $f1
  l.d $f2, dub

  # Load integer from user
  li $v0, 5
  syscall
  move $a1, $v0

  # Convert integer to double
  mtc1.d $a1, $f12
  cvt.d.w $f12, $f12


  # Multiply double by 1.3
  mul.d $f12, $f12, $f2

  # Print result
  li $v0, 3
  syscall

  # Print newline
  li $v0, 4
  la $a0, newline
  syscall


  # Exit properly
  li $v0, 10
  syscall
