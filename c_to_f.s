.global main
.text
main:
    SUB sp, sp, #4
    STR lr, [sp, #0]


    
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr
