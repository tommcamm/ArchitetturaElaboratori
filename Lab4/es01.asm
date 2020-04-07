	.data

	.globl	main
	
	.text

main:

	# mettere le istruzioni per caricare i valori 
	# 10 5 20 e 100 rispettivamente nei registri
	# $s0 $s1 $s2 $s3

	li $s0, 10
	li $s1, 5
	li $s2, 20
	li $s2, 100

	add $t0, $s0, $s1
	add $t1, $s2, $s3
	add $t2, $t1, $t0

	# Cosa c'e' nel registro $t2? ___________
	li $v0, 1
	add $a0, $t2, $0
	syscall # <- valore del registro t2 


	# finisce il programma (syscall exit)
	li	$v0, 10
	syscall
