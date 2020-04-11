	.data
valori:	.word -1, 1, 2
	.text
	.globl main
main:	
	la $t0, valori
	lw $t1, 0($t0)
	bgtz $t1, somma
	bltz $t1, moltip
	j opand
	
somma:	
	add $s0, $0, $t1
	lw $t1, 4($t0)
	add $s0, $s0, $t1
	lw $t1, 8($t0)
	add $s0, $s0, $t1
	j exit
	
moltip:	
	lw $t2, 4($t0)
	mul $s0, $t1, $t2 # mul -> multiply without overflow
	lw $t2, 8($t0)
	mul $s0, $s0, $t2
	j exit
	
opand:	
	lw $t1, 4($t0)
	lw $t2, 8($t0)
	and $s0, $t1, $t2
	
exit:	
	li $v0, 1 # Stampa risultato (in base 10)
	move $a0, $s0
	syscall
	
	# Exit
	li $v0, 10
	syscall