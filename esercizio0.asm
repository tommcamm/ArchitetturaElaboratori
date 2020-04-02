# Esercizio 0, MIPS training
# Segmento DATA, il numero dentro la tipologia word è interpretato in base 10!
	.data 
num1: .word 50
num2: .word 40
	
# Segmento Text (dove sono presenti le istruzioni)
	.text
	.globl main
main:	lw $t0, num1
		lw $t1, num2
		add $s0, $t0, $t1 # Addizione tra i due registri temporanei $t0 e $t1, risultato inserito nel registro $s0
		jr $ra