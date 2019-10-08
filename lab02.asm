.data
space: .asciiz " "
Arr: .word 21,20,51,83,20,20
length: .word 6
x: .word 20
y: .word 5
index: .word 0
.text
	la $s0, Arr
	la $s1, 0($s0)
	la $s2, x
	la $s3, y
	la $s5, length
	la $s4, index
	
	lw $t1, 0($s2) #x
	lw $t2, 0($s3) #y
	lw $t3, 0($s5) #length
	lw $t4, 0($s4) #index

	
loop:	beq  $t4, $t3, Exit
	lw $t0, 0($s1)	#value of Arr
	beq $t0,$t1,change
	li $v0,1
	move $a0, $t0
	syscall
	li $v0,4
	la $a0, space
	syscall
	addi $t4,$t4,1
	sw $t0,0($s1)
	addi $s1, $s1,4
	j loop
	
	
	
change: add $t0,$t2,$zero
	li $v0,1
	move $a0, $t0
	syscall
	li $v0,4
	la $a0, space
	syscall
	addi $t4,$t4,1
	sw $t0,0($s1)
	addi $s1, $s1,4
	j loop
	
	
Exit:   li $v0, 10 
	syscall

	
	
	
	
	
	
