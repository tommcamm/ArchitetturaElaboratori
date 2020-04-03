# PARTE 1: Calcolare a*3	(a+a+a)	con	due	istruzioni.	Il	valore a si trova nel registro $8.	Il	risultato è richiesto nel registro $9
# PARTE 2: 	Calcolare a*4	(a+a+a+a)	con	due	istruzioni.	Il	valore a si trova nel registro $8.	Il	risultato è richiesto nel registro $9

    .data
spazio: .asciiz " "
    .text
    .globl main
main:   # PARTE 1
        addi $8, $8, 10 # Inizializzo registro 8 con valore 10
        add $9, $8, $8
        add $9, $9, $8

        addi $v0, $zero, 1 # systemcall 1 per stampare un intero su console
        add $a0, $9, $0 # sposto il risultato sul registro dei parametri a0
        syscall

        # TEST (Inserimento di un carattere spazio nella console)
        and $a0, $a0, $0 # Pulitura dei registri a0 e v0, dato che dobbiamo cambiarli
        and $v0, $v0, $0
        addi $v0, $v0, 4 # inserimento nel registro v0 del valore 4, per indicare print_stirng
        la $a0, spazio # Presudoistruzione per abbreviare "lui $4, 4097"  -- 4097-> indirizzo del datasegment relativo al carattere spazio

        syscall

        # PARTE 2 
        and $8, $8, $0 # Azzero il registro 8 e 9
        and $9, $9, $0

        addi $8, $8, 20 # Re-Inizializzo il registro 8 con il valore di 20
        add $9, $8, $8 # Esegui la moltiplicazione a*4 con solo due istruzioni
        add $9, $9, $9

        and $v0, $v0, $0 # Pulitura dei registri e stampa dei risultati
        and $a0, $a0, $0
        addi $v0, $0, 1
        addi $a0, $9, 0

        syscall

        jr $ra