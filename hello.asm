
# Hello world by tommy
	.data
data:	.asciiz "Hello World" # .asciiz inserisce nella memoria testo ascii

	.text
	.globl main
main:	li $v0, 4 # Inserisco il valore 4 nel registro paramentro v0 (con pseudoistruzione)
		la $a0, data # Carico Stringa da data segment a registro $a0
		syscall
		jr $ra