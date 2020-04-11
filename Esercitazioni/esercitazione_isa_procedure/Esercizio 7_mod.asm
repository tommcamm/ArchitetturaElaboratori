	.data
text1:	.asciiz "Inserisci valore: "
text2:	.asciiz "Risultato: "
valori:	.word 0
	.text
	.globl main
main:	# toread: code: 5, output-> v0
	
	la $t0, valori
	addi $t3, $t0, 12
req:	# Ciclo richiesta valori ad utente (via console)
	beq $t0, $t3, exitc
	jal num
	sw $v0, 0($t0)
	addi $t0, $t0, 4
	j req
	
exitc:
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
	
opand:	lw $t1, 4($t0)
	lw $t2, 8($t0)
	and $s0, $t1, $t2
	
exit:	
	li $v0, 4
	la $a0, text2
	syscall

	li $v0, 1 # Stampa risultato (in base 10)
	move $a0, $s0
	syscall
	
	# Exit
	li $v0, 10
	syscall
	
	
num:	# Procedura richiesta numeri
	li $v0, 4
	la $a0, text1
	syscall
	
	li $v0, 5
	syscall
	jr $ra
	