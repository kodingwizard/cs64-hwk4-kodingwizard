# fibonacci.asm program
# CMPSC 64, (c) 2025, Z.Matni
#
#    unsigned int n, f1 = 1, f2 = 1, i = 2, nextfib;
#    cout << "Enter a number:\n";
#    cin >> n;
#    if (n > 1) {
#        cout << "The first " << n << " numbers in the Fibonacci series are:\n";
#        cout << f1 << " " << f2;
#        while (i < n) {
#            nextfib = f1 + f2;
#            f1 = f2;
#            f2 = nextfib;
#            cout << " " << nextfib;
#            i++;
#        }
#    }
#   cout << endl;

.data
	prompt:     .asciiz "Enter a number:\n"
    first:      .asciiz "The first "
    numbers:    .asciiz " numbers in the Fibonacci series are:\n"
	spacech:    .asciiz " "
    newline:    .asciiz "\n"
	
.text
main:
# TODO: Follow the comments below, and the assignment description, 
#       as guides for how to write this assembly program.


# Print the prompt and get user input
    la $a0, prompt
    li $v0, 4
    syscall

    li $v0, 5
    syscall

    move $t0, $v0

    li $t1, 1
    li $t2, 1
    li $t3, 2

    bgt $t0, $t1, start
    j exit

start:
    la $a0, first
    li $v0, 4
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    la $a0, numbers
    li $v0, 4
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    la $a0, spacech
    li $v0, 4
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    blt $t3, $t0, fib
    j exit

fib:

    bge $t3, $t0, exit
    add $t4, $t1, $t2
    move $t1, $t2
    move $t2, $t4

    la $a0, spacech
    li $v0, 4
    syscall

    move $a0, $t4
    li $v0, 1
    syscall

    addi $t3, $t3, 1
    j fib

exit:
    la $a0, newline
    li $v0, 4
    syscall
    li $v0, 10
    syscall


	
# Initialize all registers needed in the program (as appropriate)

# if (exit conditions are met) then go to exit
# otherwise:
    # print "The first " n " numbers in the Fibonacci series are:\n"
    # print f1 " " f2

    # while loop:

#exit:
# print newline

# quit program
