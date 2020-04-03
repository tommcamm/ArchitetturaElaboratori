# Dato un array determinare l'elemento minimo
# Considerazioni: 1. Bisogna utilizzare lo stack 2. opzionale determinare se l'array ha almeno due elementi

    .data
array:  .word -5, 4, 3, 2, 5, 7
dim_array:  .word 6

    .text
    .globl main
main:   addi $sp, $sp, -40   # subu -> Subtract without overflow, impostando lo stackPointer con 10 word di spazio
        sw $fp, 0($sp)
        sw $ra, 4($sp)
        sw $a0, 8($sp)
        sw $a1, 12($sp)
        sw $a2, 16($sp)
        sw $a3, 20($sp)
        addi $fp, $sp, 36 # Impostato il frame pointer allo stackpointer+36

        la $a0, array
        la $t0, dim_array
        lw $a1, 0($t0)

        jal min_array

        move $a0, $v0 # Stampa del risultato
        li $v0, 1
        syscall

        lw $ra, 4($sp) # Ripristiniamo lo stack
        lw $a0, 8($sp)
        lw $a1, 12($sp)
        lw $s2, 16($sp)
        lw $s3, 20($sp)
        lw $fp, 0($sp)
        addi $sp, $sp, 40

        jr $ra

min_array:  # PROCEDURA: Minimo array
            addi $sp, $sp, -24 # frame di 6 word
            sw $fp, 0($sp)
            sw $ra, 4($sp)
            sw $a0, 8($sp)
            addi $fp, $sp, 20
            sw $a1, 0($fp) # ?

            move $t0, $a0
            move $t1, $a1
            lw $a0, 0($t0)
            lw $a1, 4($t0)
            addi $t1, $t1, -2
            addi $t0, $t0, 8

ciclo:      jal min2numeri
            addi $t1, $t1, -1
            bltz $t1, fine_array
            lw $a0, 0($t0)
            addi $t0, $t0, 4
            move $a1, $v0
            j ciclo

fine_array: lw $ra, 4($sp) # Ripristino registri dallo stack e liberazione dello stesso
            lw $a0, 8($sp)
            lw $a1, 0($fp)
            lw $fp, 0($sp)
            addi $sp, $sp, 24
            jr $ra # Torniamo dal chiamante (avendo salvato $ra)


min2numeri: # PROCEDURA: Minimo tra due numeri
            slt $t0, $a0, $a1
            beq $t0, $0, then
            move $v0, $a0
            j end2num
then:       move $v0, $a1
end2num:    jr $ra