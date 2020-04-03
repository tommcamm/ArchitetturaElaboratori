# Esercizio 3
# Calcolare la somma del valore che è memorizzato nel registro $17, e del valore memorizzato nella locazione di memoria che si trova 14
# parole di	memoria più avanti rispetto all’indirizzo specificato dal contenuto del	registro $16

    .data
temp:   .word 10
    .text
    .globl main
main:   
        la $t0, temp # Inizializzo esercizio, ottenendo su $t0 il valore della prima parola, poi sposto su $16 sottraendo 56 per validità esercizio
        addi $16, $t0, -56
        li $17, 5

        # INIZIO esercizio
        lw $t1, 56($16)
        add $t3, $17, $t1

        sw $t3, 68($16)

        jr $ra