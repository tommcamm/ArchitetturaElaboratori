# Il programma definisce quattro numeri num1, num2, num3 e num4,
# Definisce una procedura “somma1” che riceve due numeri come parametri e restituisce la loro somma
# Chiama due volte la procedura passando come parametri prima num1 e num2
# (memorizzando il risultato in result1), poi num3 e num4 (memorizzando il
# risultato in result2)
    .data
num1:   .word 50
num2:   .word 14
result1:    .word 0
num3:   .word 50
num4:   .word -66
result2:    .word 0

    .text
    .globl main
main:   lw $a0, num1 # Predisposizione primo parametro
        lw $a1, num2 # Predisposizione secondo paramentro
        add $s0, $zero, $ra  # Accrocco molto brutto per preservare il registro $ra dentro il registro $s0

        jal somma1
        # jal = Jump and Link, l'indirizzo della istruzione viene salvato nel registro $ra

        sw $v0, result1 # Memorizzo in memoria il risultato della procedura.

        lw $a0, num3
        lw $a1, num4
        jal somma1

        sw $v0, result2

        jr $s0 # Termino la procedura main

somma1: add $v0, $a0, $a1 # da questo punto inizia la procedura somma! i registri $a0 - $a1 sono per i parametri, quelli $v0 e $v1 sono per il risultato
        jr $ra