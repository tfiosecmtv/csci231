.data
	arrow: .asciiz "->"
	nl: .asciiz "\n"
	S: .asciiz "HelloWorld"
	n: .word 10
	space: .asciiz " "

.text

	la $s0, S
	la $s1, n

main:	li $v0, 4
	la $a0, arrow
	syscall
	li $v0, 4
	la $a0, S
	syscall
	li $v0, 4
	la $a0, nl
	syscall
	lw $a0, 0($s1)
	move $a1, $s0
	jal my_bubble_sort
	jal print 
	jal exit
	
my_bubble_sort:	
		addi, $sp, $sp, -20
		sw $t2, 0($sp) # i
		sw $t3, 4($sp) # j
		sw $s0, 8($sp) 
		sw $s1, 12($sp) 
		sw $s2, 16($sp) 

		addi $a0, $a0, -1 # n-1 for loop condition
		
loop1:	
	beq $t2, $a0, back1
	sub $t5, $a0, $t2 # n-1-i condition for second nested loop
	addi $t2, $t2, 1
	move $s2, $a1
	li $t3, 0
loop2:  lb $t0, 0($s2)
        beq $t3, $t5, loop1
	lb $t6, 1($s2) # S[j+1]
	slt $t4, $t0, $t6 # condition for swapping
	beq $t4, 0, swap
	add $t3, $t3, 1
	add $s2, $s2, 1
	j loop2
	
swap:   add $t7, $t6, $zero
	add $t6, $t0, $zero
	add $t0, $t7, $zero
	sb $t0, 0($s2)
	sb $t6, 1($s2)
	addi $t3, $t3, 1
	addi $s2, $s2, 1
	j loop2

back1:  addi $a0, $a0, 1
	lw $t2, 0($sp) # i
	lw $t3, 4($sp) # j
	lw $s0, 8($sp) 
	lw $s1, 12($sp) 
	////种种种种种种lw $s2, 16($sp) 
     	addi $sp, $sp, 20
        li $t2, 0
	jr $ra

print:  
	li $v0, 4
	la $a0, arrow
	syscall
	li $v0, 4
	la $a0, S
	syscall
	jr $ra

exit:   li $v0, 10
	syscall
