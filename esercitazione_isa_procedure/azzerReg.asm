    .text
    .globl main
main:   addi $t0, $t0, 5         # aggiungo 5 ad il registro t0 per poi dimostrare l'azzeramento
        move $t0, $0		# addu (add unsigned), addu $t0, $0, $0, -> è una pseudoistruzione! 
        li $t0, 0           # LoadImmediate -> ori $8, $0, 0
        jr $ra