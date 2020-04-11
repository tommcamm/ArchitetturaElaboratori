# Esercizio 6, eser 5
	.data
str:	.asciiz "La risposta e': "
numero:	.word	42

	.text
	.globl main
main:	li $v0, 4
	la $a0, str
	syscall
	
	li $v0, 1
	lw $a0, numero
	syscall
	
	# Exit
	li $v0, 10
	syscall