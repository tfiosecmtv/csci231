.data

Arr:    .word 21, 20, 51, 83, 20, 20
x: 	.word 20
length: .word 6
y: 	.word 5
index:  .word 0
space: .asciiz " "
nl:    .ascii "\n"
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
	
	jal printArrInt
	li $v0,4
	la $a0, nl
	syscall	
	jal replace
	jal printArrInt
	li $v0,10
	syscall
	
printArrInt: 	addi $sp,$sp,-16	
		sw $t3, 0($sp)
		sw $t4, 4($sp)
		sw $s1, 8($sp)
		
loop1:	 beq  $t4, $t3, stop1
	 lw $t0, 0($s1)	#value of Arr
	 sw $t0, 12($sp)
	 
       	 li $v0,1
	 move $a0, $t0
	 syscall
	 li $v0,4
	 la $a0, space
	 syscall
	 
	 addi $t4,$t4,1
	 addi $s1, $s1,4
	 j loop1

stop1:   lw $t3, 0($sp)
	 lw $t4, 4($sp)
	 lw $s1, 8($sp)
	 lw $t0, 12($sp) 
	 addi, $sp,$sp,16
	 jr $ra

	
replace: addi $sp, $sp, -20
	 sw $t1, 0($sp)
	 sw $t2, 4($sp)
	 sw $t3, 8($sp)
	 sw $t4, 12($sp)
	 sw $s1, 16($sp)
	
loop:	 beq  $t4, $t3, stop
	 lw $t0, 0($s1)	#value of Arr
       	 beq $t0,$t1,change
	 addi $t4,$t4,1
	 sw $t0,0($s1)
	 addi $s1, $s1,4
	 j loop
	
change:  add $t0,$t2,$zero
	 addi $t4,$t4,1
	 sw $t0,0($s1)
	 addi $s1, $s1,4
	 j loop

stop:	 lw $t1, 0($sp)
	 lw $t2, 4($sp)
	 lw $t3, 8($sp)
	 lw $t4, 12($sp) 
	 lw $s1, 16($sp)
	 addi, $sp,$sp,20
	 jr $ra


    
    
