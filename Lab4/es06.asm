# Esercizio 6 (Difficile)
	.data
str:	.asciiz "aabbccaa"
	.text
	.globl main
main:	la $t0, str # Carico in $t0 l'indirizzo del primo carattere
ciclo:	lb $t1, 0($t0) # Carico in $t1 il primo carattere (con lb -> loadbyte)
	beq $t1, 0, exit # se il carattere è /0 vuol dire che ho finito
	bne $t1, 97, neq # se il carattere non è 'a' passo alla parte di incremento dell'indirizzo e riparte il ciclo
	li $t1, 101
	sb $t1, 0($t0)
neq:	addi $t0, $t0, 1
	j ciclo

exit:	li $v0, 4 # Stampo nella console il risultato (per leggibilità)
	la $a0, str
	syscall

	# Exit
	li $v0, 10
	syscall