# Esercizio 10, Esercitazione 5
	.data
array:	.word 1, 1, 2, 1, 2

	.text
	.globl main
main:	la $a0, array
	li $a1, 5
	
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	
	jal somma
	
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	
	# Stampa del risultato
	move $a0, $v0
	li $v0, 1
	syscall
	
	# Exit
	li $v0, 10
	syscall
	
somma:	# Procedura somma
	move $t0, $a0
	move $t1, $a1
ciclo:	beqz $t1, exitc
	lw $t3, 0($t0)
	add $t2, $t2, $t3
	addi $t0, $t0, 4
	addi $t1, $t1, -1
	j ciclo

exitc:	move $v0, $t2
	jr $ra # Return