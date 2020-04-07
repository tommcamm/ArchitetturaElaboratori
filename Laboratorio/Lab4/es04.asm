# Esercizo 4 (Facile)
	.data
text1:	.asciiz "Inserisci numero: "
text2:	.asciiz "Valore assoluto: "
	.text
	.globl main
main:	# Stampa del testo per inserimento numero
	li $v0, 4
	la $a0, text1
	syscall
	
	li $v0, 5 #Leggo numero intero da console, (il numero letto si troverà nel registro $v0)
	syscall
	
	
	move $t0, $v0 # Sposto il numero da processare da $v0 a $t0
	bltz $t0, lszero # Controllo se il numero è minore di zero
	j mrzero # Se il numero è già positivo mi sposto nella parte finale del programma
	
lszero:	sub $t0, $0, $t0 # $t0 = 0 - $t0  

mrzero:	
	li $v0, 4 # Operazione conclusa! stampa del risultato ed uscita
	la $a0, text2
	syscall

	li $v0, 1
	move $a0, $t0
	syscall
	
	
	# Exit
	li $v0, 10
	syscall