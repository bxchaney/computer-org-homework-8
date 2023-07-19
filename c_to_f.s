.global main
.text
main:
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # prompt
    LDR r0, =prompt
    BL printf

    # scanf
    LDR r0, =input
    LDR r1, =celsius
    BL scanf

    # call CToF
    LDR r0, =celsius
    LDR r0, [r0]
    BL CToF

    # print result
    MOV r2, r0
    LDR r1, =celsius
    LDR r1, [r1]
    LDR r0, =output
    BL printf
    
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Please provide a temperature in C: "
    input: .asciz "%d"
    celsius: .word 0
    output: .asciz "%d C is %d F\n"
