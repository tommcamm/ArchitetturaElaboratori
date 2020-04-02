# Esercizio 1 Lezione 12
    .data
stringa:    .asciiz "Hello World!"
dim:    .word 0
charfine:   .asciiz ""

    .text
    .globl main
main:   la $t0, stringa # Load address, SERVE PER OTTENERE L'INDIRIZZO DI MEMORIA E NON IL CONTENUTO!!! da non confondere con lw
        add $t2, $zero, $zero
        la $s5, charfine
        lb $s1, 0($s5) # Load byte - legge un carattere su un byte

ciclo:  
        lb $s7, 0($t0)
        beq $s7, $s1, fine
        addi $t2, $t2, 1
        addi $t0, $t0, 1

        j ciclo

fine:   
        la $t3, dim
        sw $t2, 0($t3)

        li $v0, 4
        la $a0, stringa
        syscall

        li $v0, 1
        la $t0, dim
        lw $a0, 0($t0)
        syscall
        
        jr $ra

