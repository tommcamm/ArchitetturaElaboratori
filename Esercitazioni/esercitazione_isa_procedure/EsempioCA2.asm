# Esempio CA2, Esercitazione 5 (ISA)

	.data
array:	.word 1, 1, 0, 1, 1, 0, 0, 0
	.text
	.globl main
main:	la $a0, array

	addi $sp, $sp, -20
	sw $ra, 8($sp)
	
	jal ca2
	
	# Ripristino dello stack
	lw $ra, 8($sp)
	addi $sp, $sp, 20
	
	# Exit
	li $v0, 10
	syscall
	
ca2:	# Procedura CA2
	addi $t0, $a0, 28
	lw $t1, 0($t0) 
ciclo:	beq $t1, 1, endc1
	addi $t0, $t0, -4
	lw $t1, 0($t0)
	addi $t2, $t2, 1
	j ciclo

endc1:	addi $t0, $t0, -4
	addi $t2, $t2, 1
	
ciclo2:	beq $t2, 8, endc2

	lw $t1, 0($t0)

	addi $sp, $sp,  -32
	sw $ra, 4($sp)
	sw $a0, 8($sp)
	sw $t0, 12($sp)
	sw $t1, 16($sp)
	sw $t2, 20($sp)
	
	move $a0, $t1	
	jal inv
	
	lw $ra, 4($sp)
	lw $a0, 8($sp)
	lw $t0, 12($sp)
	lw $t1, 16($sp)
	lw $t2, 20($sp)
	addi $sp, $sp, 32
	
	sw $v0, 0($t0)
	addi $t0, $t0, -4
	addi $t2, $t2, 1
	j ciclo2	

endc2:	
	# Return
	jr $ra
	
inv:	# Procedura Inverti (0->1, 1->0)
	beq $a0, 0, zer
	li $v0, 0
	j exiti
zer:	li $v0, 1
exiti:	jr $ra