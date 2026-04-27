# maximum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum absolute value (e.g., entering -3, 2, 1 will give the answer 3)
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

	nextNum: .asciiz "Enter the next number:\n"
    newLine: .asciiz "\n"
	max: .asciiz "Maximum: "

#Text Area (i.e. instructions/code directive)
.text
main:

	la $a0, nextNum
	li $v0, 4
	syscall

	li $v0, 5
	syscall

	move $t0, $v0

	li $v0, 4
	syscall

	li $v0, 5
	syscall

	move $t1, $v0

	li $v0, 4
	syscall
	li $v0, 5
	syscall

	move $t2, $v0


check:
	slt $t9, $t0, $zero
	bne $t9, $zero, comp
check_two:
	slt $t9, $t1, $zero
	bne $t9, $zero, comp_two
check_three:
	slt $t9, $t2, $zero
	bne $t9, $zero, comp_three
	j start
comp: 
	nor $t0, $t0, $zero
	addi $t0, $t0, 1
	j check_two
comp_two:
	nor $t1, $t1, $zero
	addi $t1, $t1, 1
	j check_three
comp_three:
	nor $t2, $t2, $zero
	addi $t2, $t2, 1
start:
	move $t3, $t0
	bgt $t1, $t3, set_max_one
	bgt $t2, $t3, set_max_three
	j exit
set_max_one:
	bge $t1, $t2, set_max_two
	move $t3, $t2
	j exit
set_max_two:
	move $t3, $t1
	j exit
set_max_three:
	bge $t2, $t1, set_max_four
	move $t3, $t1
	j exit
set_max_four:
	move $t3, $t2
exit:
	la $a0, max
	li $v0, 4
	syscall

	li $v0, 1
	move $a0, $t3
	syscall

	la $a0, newLine
	li $v0, 4
	syscall

	li $v0, 10
	syscall
	# TODO: Write code to properly exit a SPIM simulation

