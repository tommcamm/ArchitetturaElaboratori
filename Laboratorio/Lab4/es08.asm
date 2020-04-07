#  Esercizio 8 (Difficile)
#  TODO: Inserimento dei numeri dell'array all'utente
	.data
array:	.word 1, 2, 3, 4, 5, 6
numel:	.word 6
text1:	.asciiz "Elemento minimo: "
text2:	.asciiz "\nElemento massimo: "
	
	.text
	.globl main
main:	la $s0, array
	lw $s1, numel
	lw $t2, 0($s0) # inizializzo il min al primo elemento
	lw $t1, 0($s0) # inizializzo il max al primo elemento
	
ciclo:	beq $t3, $s1, exit # $t1 il max, $t2 il min
	lw $t0, 0($s0)
	blt $t0, $t2, nmin
	bgt $t0, $t1, nmax
	j next
nmin:	move $t2, $t0
	j next
nmax:	move $t1, $t0
next:	addi $s0, $s0, 4
	addi $t3, $t3, 1
	j ciclo
	
exit:	li $v0, 4 # Programma terminato, stampo il minimo e massimo
	la $a0, text1
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, text2
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	# Exit
	li $v0, 10
	syscall
