/**
 * This program prompts the user for a number of inches, calls the InchesToFeet
 * function, and returns the corresponding number of inches.
 */
.global main
.text
main:

    SUB sp, sp, #4
    STR lr, [sp, #0]
    
    # Prompt
    LDR r0, =prompt
    BL printf

    # scanf
    LDR r0, =input
    LDR r1, =inches
    BL scanf

    LDR r0, =inches
    LDR r0, [r0]
    BL InchesToFt

    MOV r2, r0
    LDR r1, =inches
    LDR r1, [r1]
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Provide a number of inches: "
    input: .asciz "%d"
    inches: .word 0
    output: .asciz "%d inches is %d feet.\n"
