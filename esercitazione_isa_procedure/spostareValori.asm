# Obiettivo: Spostare valori da un registro ad un altro

    .text
    .globl main
main:   addi $t0, $t0, 5    # Inizializzo il valore 5 sul registro t0 da spostare sul t1
        addi $t1, $t0, 0    # Addizione su registro $t1, usando registro $t0 addizionato con 0
        jr $ra