# Calcolare a*3	(a+a+a)	con	due	istruzioni.	Il	valore a si trova nel registro $8.	Il	risultato è richiesto nel registro $9

    .text
    .globl main
main:   addi $8, $8, 10 # Inizializzo registro 8 con valore 10
        add $9, $8, $8
        add $9, $9, $8
        jr $ra