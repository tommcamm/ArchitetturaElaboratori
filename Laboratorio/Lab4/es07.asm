# Esercizio 7 (Difficile)
# Dovrebbe essere implementato in una procedura in quanto $v0 deve essere usato alla fine per la syscall di uscita (settato su 10)
# TODO: Implementare questo segmento di codice in una procedura
	.data
elem:	.word 1, 2, 3, 4, 5
	
	.text
	.globl main
main:	la $a0, elem
	li $a1, 5
	li $a2, 3
	
	move $t0, $a0
	
ciclo:	beq $t2, 5, exit
	lw $t1, 0($t0)
	bne $t1, $a2, neq
	li $v0, 1
neq:	addi $t0, $t0, 4
	addi $t2, $t2, 1
	j ciclo

	# Exit
exit:	li $v0, 10
	syscall