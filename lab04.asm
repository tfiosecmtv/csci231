.data

S: .asciiz  "Anadia"
length: .word 6

.text

la 	$a0, S
la 	$a1, length

lw 	$t1, 0($a1)	#t1=address of length

srl  	$t3, $t1, 1	#t3 = length/2
addi	$t1, $t1, -1

add	$t2, $zero, $zero	#index to start from the beginning
jal     reverse
	li $v0,10
	syscall

reverse:
while: 	addi 	$sp, $sp, -16
	sw	$t0, 0($sp)	#the pointer to S element
	sw	$t6, 4($sp)	#length from the end 
	sw	$t2, 8($sp)	#to start from the beginning
	sw	$t4, 12($sp)	#temporary character for swap
	beq $t2, $t3, Exit
	add $s0, $a0, $t2
	lbu $t0, 0($s0)		#first char of S
	sub $t6, $t1, $t2
	add $s0, $a0, $t6
	lbu $t4, 0($s0)		#last char of S
	
	sb  $t0, 0($s0)
	add $s0, $a0, $t2
	sb  $t4, 0($s0)
	addi $t2, $t2, 1 
	j while

Exit: 	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t4, 12($sp)
	addi $sp, $sp, 16
	li $v0, 4
	la $a0, S
	syscall
	jr $ra
