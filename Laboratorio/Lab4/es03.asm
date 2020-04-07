	# Essendo un programma senza fine, consiglio di scegliere una velocità di esecuzione limitata (es. 10 istruzioni al secondo)
	.data
space:	.asciiz "\n"
	.text
	.globl main
main:	li $t0, 20 # Azzeramento di $t1, e assegnamento del valore 20
	addi $t1, $t1, 1
	
ciclo:	addi $t0, $t0, 1
	blt $t0, 31, ciclo
	
	# Stampa del carattere vai a capo (per leggibilità)
	li $v0, 4
	la $a0, space
	syscall
	
	# Stampa del contatore dell'azzeramento del registro $t0
	li $v0, 1
	add $a0, $0, $t1
	syscall
	j main # Faccio partire il programma da capo
	