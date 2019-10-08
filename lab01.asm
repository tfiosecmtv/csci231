.data

	fibo: .word 0, 1

.text


	la $s0, fibo
	lw $t0, 0($s0)
	lw $t3, 4($s0)
	add $t1, $t0, $t3
	sw $t1, 8($s0)
    
    
	lw $t0,4($s0)
	lw $t3, 8($s0)
	add $t1, $t0, $t3
	sw $t1, 12($s0)
	
	lw $t0,8($s0)
	lw $t3, 12($s0)
	add $t1, $t0, $t3
	sw $t1, 16($s0)
	
	lw $t0,12($s0)
	lw $t3, 16($s0)
	add $t1, $t0, $t3
	sw $t1, 20($s0)
	
	lw $t0,16($s0)
	lw $t3, 20($s0)
	add $t1, $t0, $t3
	sw $t1, 24($s0)
    
    
    
