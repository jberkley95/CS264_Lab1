#Written By: John Berkley
#Class: CS264 - Assembly Language Programming
#Professor: Dr. Salam Salloum	
#Date Last Edited: 10/4/2017
	
	.data	
array: 	.space 80		#create array w/ space for 20 integers
prmpt1: .asciiz "\nEnter 20 Integers: \n"
prmpt2: .asciiz "\nEnter a Positive Integer Less Than 20: "
prmpt3: .asciiz "\n~~~Output~~~\n"
newln:	.asciiz "\n"
space:	.asciiz " "

	.text
main:	
	li $t0, 20		#counter variable for array spaces
	la $t1, array		#load starting address of array
	la $a0, prmpt1		#load prmpt1
	li $v0, 4		#print string code (4)
	syscall
loopR:	
	li $v0, 5		#read integer code (5)
	syscall
	sw $v0, 0($t1)		#store the integer
	add $t0, $t0, -1	#decriment counter
	add $t1, $t1, 4		#load address of next array index
	bgtz $t0, loopR		#repeat reading until all 20 integers are processed
	li $t0, 20		#reset counter
	la $t1, array		#re-load array
	la $a0, prmpt2		#load prompt 2
	li $v0, 4		#print string code (4)
	syscall
	li $v0, 5		#read integer code (5)
	syscall
	move $t2, $v0		#store integer in $t2
	move $t3, $t2		#copy t2 to t3
	la $a0, prmpt3		#load prompt 3
	li $v0, 4		#print string code (4)
	syscall
loopP1:	
	lw $a0, 0($t1)		#load integer from array
	li $v0, 1		#print integer code (1)
	syscall
	add $t0, $t0, -1	#decriment counter
	add $t1, $t1, 4		#load address of next array index
	la $a0, newln		#load new line character
	li $v0, 4		#print string code (4)
	syscall
	bgtz $t0, loopP1	#repeat untill all integers are printed
	li $t0, 20		#reset counter
	la $t1, array		#re-load array
	la $a0, newln		#load new line character
	li $v0, 4		#print string code (4)
	syscall
loopP2:
	lw $a0, 0($t1)		#load integer from array
	li $v0, 1		#print integer code (1)
	syscall
	add $t0, $t0, -1	#decriment counter
	add $t1, $t1, 4		#load address of next array index
	la $a0, space		#load space character
	li $v0, 4		#print string code (4)
	syscall
	bgtz $t0, loopP2	#repeat untill all integers are printed
	la $a0, newln		#load new line character
	li $v0, 4		#print string code (4)
	syscall
	li $t0, 20		#reset counter
	add $t1, $t1, -4	#set array pointer to last index
	la $a0, newln		#load new line character
	li $v0, 4		#print string code (4)
	syscall
loopP3:
	lw $a0, 0($t1)		#load integer from array
	li $v0, 1		#print integer code (1)
	syscall
	add $t0, $t0, -1	#decriment counter
	add $t1, $t1, -4	#load address of next array index
	la $a0, space		#load space character
	li $v0, 4		#print string code (4)
	syscall
	bgtz $t0, loopP3	#repeat untill all integers are printed
	la $a0, newln		#load new line character
	li $v0, 4		#print string code (4)
	syscall
	li $t0, 20		#reset counter
	la $t1, array		#re-load array
	la $a0, newln		#load new line character
	li $v0, 4		#print string code (4)
	syscall
	j loopP5
loopP4:
	move $t2, $t3		#reset t2
	la $a0, newln		#load new line character
	li $v0, 4		#print string code (4)
	syscall
loopP5:
	lw $a0, 0($t1)		#load integer from array
	li $v0, 1		#print integer code (1)
	syscall
	add $t0, $t0, -1	#decriment counter
	add $t2, $t2, -1	#decriment newline counter
	add $t1, $t1, 4		#load address of next array index
	la $a0, space		#load space character
	li $v0, 4		#print string code (4)
	syscall
	blez $t0, stop		#end program when all numbers have been printed
	blez $t2, loopP4	#repeat until new line is required
	j loopP5		#repeat printing single numbers
stop:	
	li $v0, 10		#end program code (10)
	syscall	
