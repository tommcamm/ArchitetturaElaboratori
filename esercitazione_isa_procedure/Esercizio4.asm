# Esercizio 4
# guarda la slide per le istruzioni (non ho sbatti di fare copia e incolla)

    .data
begin:  .word 1
        .word 2
        .word 3
        .word 4
    .text
    .globl main
main:   la $10, begin

        lw $t1, 0($t0)
        addi $t1, $t1, 10
        sw $t1, 0($t0)

        # ERRORE - DA FINIRE

        jr $ra