# Esercizio 5 (medio)
	.data
	
	.text
	.globl main
main:	li $t0, 20 # Carico in $t0 il primo numero su cui operare
	li $t1, 0x10010000 # Carico im $t1 il primo indirizzo di memoria
	
ciclo:	sw $t0, 0($t1) # Salvo nella memoria il contenuto di $t0, nell'indirizzo $t1 (con offset = 0)
	addi $t0, $t0, 1
	addi $t1, $t1, 4 # addiziono 4 all'indirizzo di memoria per passare alla word successiva
	blt $t0, 31, ciclo  # se non ho ancora raggiunto 30 riparte tutto da capo
	
	# Exit
	li $v0, 10
	syscall